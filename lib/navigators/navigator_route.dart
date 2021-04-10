
import 'package:flutter/cupertino.dart';
import 'package:interview_task/api_calling/presentation/pages/api_screen.dart';


import '../main.dart';

Map<String, WidgetBuilder> routes = {
  rootScreen: (context) => MyApp(),
  apiScreen: (context) => ApiScreen(),
};

const String rootScreen = "/";
const String apiScreen = "apiScreen";
