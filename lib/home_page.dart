import 'package:flutter/material.dart';
import 'auth.dart';
import 'navside.dart';
class HomePage extends StatefulWidget {
  // ignore: expected_class_member
  HomePage({this.auth,this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {
    String _value;
    return MaterialApp(
      title: 'Inicio Piscis',
      home: new Scaffold(
        appBar: new AppBar(
            title: Text('Inicio',style: new TextStyle(fontFamily: 'Nunito'),),
            backgroundColor: Colors.blue
        ),
        drawer: new SideNav(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/InicioBackground.png'),
                  fit: BoxFit.cover
                )
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Bienvenido a',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 100.0,
                            child: Image.asset('assets/PiscisLogo.png'),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex:1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'Developed by FireCodes',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.8,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
