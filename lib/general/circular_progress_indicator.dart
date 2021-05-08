
import 'package:flutter/material.dart';
import 'package:interview_task/utils/screen_utils.dart';

Widget circularProgressIndicator = Center(child: CircularProgressIndicator());

Widget screenProgressIndicator = Container(
  height: height,
  width: width,
  child: Center(
    child: CircularProgressIndicator(),
  ),
);

Widget screenProgressIndicatorHalf = Container(
  height: height * 0.2,
  width: width,
  child: Center(
    child: CircularProgressIndicator(),
  ),
);
