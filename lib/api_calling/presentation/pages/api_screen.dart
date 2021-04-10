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

  @override
  void initState() {
    apiWidgetList = [];
    bloc.add(GetApiEvent());
    //http://52.66.128.99/demo-api/demo_api.php
    super.initState();
  }
  String readTimestamp(int timestamp) {

    var now = new DateTime.now();
    var format = new DateFormat('HH:mm:ss');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = date.difference(now);
    var time = '';
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }
    return time;
  }
  @override
  Widget build(BuildContext context) {
    Scr.setScreenSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is LoadingBeginApiState) isLoading = true;
            if (state is LoadingEndApiState) isLoading = false;
            if (state is GetApiState) {
              apiWidgetList = [];
              state.apiResponseModel.data.forEach((Datum datum){
                dynamic milisec=  (DateTime.now().millisecondsSinceEpoch)+(datum.eventTime*60*1000);
                ApiWidget apiWidget=new ApiWidget(datum: datum,cTime: "",);
                apiWidgetList.add(apiWidget);
                int _start;
                Timer.periodic(
                  Duration(seconds: 1), (Timer timer) {

                    setState(() {
                      _start= milisec-DateTime.now().millisecond;
                      apiWidget.cTime= readTimestamp(_start);
                    });
                },
                );
              });
            }
          },
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) => Container(
              height: height,
              width: width,
              child: Stack(
                children: [
                  ListView.builder(
                    cacheExtent: 100,
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.only(bottom: 65.0),
                    itemBuilder: (context, index) {
                        return apiWidgetList[index];
                    },
                    itemCount: apiWidgetList.length,
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
