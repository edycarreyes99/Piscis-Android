import 'package:flutter/material.dart';
import 'auth.dart';
import 'home_page.dart';
import 'historial-page.dart';
import 'login_page.dart';
import 'data-table.dart';
import 'profile-page.dart';
import 'addUser-page.dart';
import 'profile-page.dart';
import 'list-list.dart';

class SideNav extends StatefulWidget {
  SideNav({this.auth,this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  static String tag = 'sidenav-page';
  void cerrarSesion() async{
    try{
      await auth.cerrarSesion();
      onCerrarSesion();
    }catch(e){
      print(e);
    }
  }
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {
    String _value;



    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Edycar Reyes'),
              accountEmail: new Text('edycarreyes@gmail.com'),
              currentAccountPicture: new GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion))),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://firebasestorage.googleapis.com/v0/b/proyecto-robotica-35bed.appspot.com/o/Profile%20Pictures%2Fedycarreyes%40gmail.com_InShot_20180427_185247614.jpg?alt=media&token=948f8280-e349-4571-b467-920dd6727af2'),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage('http://globalpathholidays.com/wp-content/uploads/2015/08/landing-page-large.jpg')
                  )
              ),
            ),
            new ListTile(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,))),
              title: new Text('Inicio'),
              trailing: new Icon(Icons.home),
            ),
            new ListTile(
              onTap: ()=>print('Tiempo Real'),
              title: new Text('Tiempo Real'),
              trailing: new Icon(Icons.whatshot),
            ),
            new ListTile(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HistorialPage(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,))),
              title: new Text('Historial'),
              trailing: new Icon(Icons.timeline),
            ),
            new ListTile(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DataTableDemo())),
              title: new Text('Streaming'),
              trailing: new Icon(Icons.visibility),
            ),
            Divider(),
            new ListTile(
              title: new DropdownButtonHideUnderline(
                child: new DropdownButton<String>(
                  hint: new Text('Cuenta'),
                  value: _value,
                  items: <DropdownMenuItem<String>>[
                    new DropdownMenuItem(
                        child: new Text('Perfil'),
                        value: 'one'
                    ),
                    new DropdownMenuItem(
                        child: new Text('Agregar Usuario'),
                        value: 'two'
                    )
                  ],
                  onChanged: (String value){
                    print(value);
                    switch(value){
                      case 'one':
                        return Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,)));
                      case 'two':
                        return Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,)));
                    }
                  },
                ),
              ),
              trailing: new Icon(Icons.account_circle),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                shadowColor: Colors.teal.shade100,
                elevation: 10.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: this.widget.cerrarSesion,
                  color: Colors.teal,
                  child: Text('Cerrar Sesion',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
