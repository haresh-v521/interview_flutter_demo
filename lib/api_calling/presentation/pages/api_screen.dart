import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_bloc.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_event.dart';
import 'package:interview_task/api_calling/presentation/bloc/api_state.dart';
import 'package:interview_task/api_calling/presentation/widget/api_widget.dart';
import 'package:interview_task/di/dependency_injection.dart';
import 'package:interview_task/general/circular_progress_indicator.dart';
import 'package:interview_task/utils/screen_utils.dart';
import 'package:intl/intl.dart';

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  Bloc bloc = getIt<ApiBloc>();
  bool isLoading = false;
  String mainError = "";
  List<ApiWidget> apiWidgetList;
  bool isAllCheck = false;

  @override
  void initState() {
    apiWidgetList = [];
    bloc.add(GetApiEvent());
    //http://52.66.128.99/demo-api/demo_api.php
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Scr.setScreenSize(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demo App"),
        ),
        backgroundColor: Colors.white,
        body: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is LoadingBeginApiState) isLoading = true;
            if (state is LoadingEndApiState) isLoading = false;
            if (state is GetApiState) {
              apiWidgetList = [];
              state.apiResponseModel.data.forEach((Datum datum) {
                ApiWidget apiWidget = new ApiWidget(
                  datum: datum,
                  cTime: "",
                );
                apiWidgetList.add(apiWidget);
              });
              apiWidgetList.sort((a, b) => a.datum.eventTime.compareTo(b.datum.eventTime));
            }
          },
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) =>

                Container(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0, top: 5.0),
                          child: Text(
                            "Select All ",
                            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Checkbox(
                          value: isAllCheck,
                          onChanged: (setAllCheck) {
                            setState(() {
                              isAllCheck = setAllCheck;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 65.0),
                      itemBuilder: (context, index) {
                        return apiWidgetList[index];
                      },
                      itemCount: apiWidgetList.length,
                    ),
                  ),
                  if (isLoading) screenProgressIndicatorHalf,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
