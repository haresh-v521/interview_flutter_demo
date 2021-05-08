import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_bloc.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_event.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_state.dart';
import 'package:interview_task/di/dependency_injection.dart';

class ApiWidget extends StatefulWidget {
  final Datum datum;
  String cTime;

  ApiWidget({Key key, this.datum, this.cTime}) : super(key: key);

  @override
  _ApiWidgetState createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<ApiWidget> {
  Bloc bloc = getIt<ApiBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is SingleCheckState) {
          widget.datum.isChecked = state.isCheck;
        }
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) =>
            Container(
          margin: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                child: Image.network("${widget.datum.eventImage}", fit: BoxFit.fill),
              ),
              Container(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0, top: 5.0),
                            child: Text(
                              "${widget.datum.eventTitle}",
                              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Checkbox(
                            value: widget.datum.isChecked,
                            onChanged: (isCheckEd) {
                              bloc.add(SingleCheckEvent(isCheck: isCheckEd));
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                        child: Text(
                          "${widget.datum.eventDescriptio}",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 0.0, top: 5.0),
                            child: Text(
                              "Date : ${widget.datum.eventDate}",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 0.0, top: 5.0),
                            child: Text(
                              "Time : ${widget.datum.eventTime}",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
