import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'splashscreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piscis App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
      //RootPage(auth: new Auth()),
      routes: routes,
    );
  }
}
