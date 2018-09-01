import 'package:flutter/material.dart';
import 'auth.dart';
import 'navside.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.auth,this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  static String tag = 'home-page';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _userName;
  String _nombre;
  String _apellido;
  String _passwordConfirm;
  String _profileURL;
  String _backgroundURL;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text('Perfil',style: new TextStyle(fontFamily: 'Nunito',color: Colors.black),),
          backgroundColor: Colors.orange,
          elevation: 10.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
      ),
      drawer: new SideNav(auth: this.widget.auth,onCerrarSesion: this.widget.onCerrarSesion,),
      body: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
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
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text('Perfil',textAlign:TextAlign.center,style: TextStyle(fontSize: 50.0),),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //Nombre
                        Text('Nombre:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  initialValue: 'Edycar',style: TextStyle(color: Colors.grey),
                                  autofocus: false,
                                  validator: (value) => value.isEmpty ? 'El Nombre no puede estar en blanco.':null,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      hintText: 'Nombre',
                                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                  )
                              ),
                        ),
                        //Apellido
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('Apellido:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: 'Reyes',
                              autofocus: false,
                              validator: (value) => value.isEmpty ? 'El Apellido no puede estar en blanco.':null,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Apellido',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              )
                          ),
                        ),
                        //UserName
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('UserName:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: 'EReyes',
                              autofocus: false,
                              validator: (value) => value.isEmpty ? 'El UserName no puede estar en blanco.':null,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'UserName',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              )
                          ),
                        ),
                        //Email
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('Email:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              initialValue: 'edycarreyes@gmail.com',
                              autofocus: false,
                              validator: (value) => value.isEmpty ? 'El UserName no puede estar en blanco.':null,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              )
                          ),
                        ),
                        //Contraseña
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('Contraseña:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              autofocus: false,
                              obscureText: true,
                              validator: (value) => value.isEmpty ? 'La Contraseña no puede estar en blanco.':null,
                              onSaved: (value) => _password = value,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              )
                          ),
                        ),
                        //Confirmar Contraseña
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text('Confirmar Contraseña:',style: TextStyle(fontSize: 30.0),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              obscureText: true,
                              autofocus: false,
                              validator: (value) => value.isEmpty ? 'La Contraseña no Puede Estar Vacia':null,
                              onSaved: (value) => _passwordConfirm = value,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              )
                          ),
                        ),
                        //Boton de Actualizar
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: (){},
                              color: Colors.orange,
                              child: Text('Actualizar Contraseña',style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          )
    );
  }
}
