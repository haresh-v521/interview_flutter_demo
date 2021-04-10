import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/ui_helper/colors.dart';
import 'package:interview_task/utils/app_preference.dart';

import 'di/dependency_injection.dart';
import 'navigators/navigator_route.dart';

setUpAll() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetServiceLocator();
  await AppPreference.init();
}

void main() async{

  await setUpAll();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: primaryColor,
      ),
      routes: routes,
      initialRoute: apiScreen,
      localizationsDelegates: [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      locale: const Locale('en', 'US'),
    );
  }
}
