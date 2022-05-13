import 'package:flutter/material.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //私有建構子
  static final MyApp instance = MyApp._internal();  //單例類

  factory MyApp() => instance;  //用來產生這個class的factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
