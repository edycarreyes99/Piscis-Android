import 'package:flutter/material.dart';
import 'auth.dart';
import 'navside.dart';

class RealTimePage extends StatefulWidget {
  RealTimePage({this.auth, this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  @override
  _RealTimePageState createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          elevation: 10.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Tiempo Real',
            style: new TextStyle(fontFamily: 'Nunito',color: Colors.black),
          ),
          backgroundColor: Colors.limeAccent),
      drawer: new SideNav(
        auth: this.widget.auth,
        onCerrarSesion: this.widget.onCerrarSesion,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Center(child: Text('Tiempo Real')),
          )
        ],
      ),
    );
  }
}
