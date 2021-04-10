import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_task/api_calling/data/datamodel/api_model.dart';
import 'package:intl/intl.dart';

class ApiWidget extends StatefulWidget {
  final Datum datum;
   String  cTime;

   ApiWidget({Key key, this.datum,this.cTime}) : super(key: key);
  @override
  _ApiWidgetState createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<ApiWidget> {

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
    return Container(
      height: 200,
      child: Text("${widget.cTime}"),
    );
  }
}
