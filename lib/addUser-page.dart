import 'package:flutter/material.dart';
import 'navside.dart';
import 'auth.dart';

class AddUser extends StatefulWidget {
  AddUser({this.auth, this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  static String tag = 'home-page';
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
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
          title: Text(
            'Nuevo Usuario',
            style: new TextStyle(fontFamily: 'Nunito', color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 10.0,
          backgroundColor: Colors.pink),
      drawer: new SideNav(
        auth: this.widget.auth,
        onCerrarSesion: this.widget.onCerrarSesion,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 50.0,
              child: Icon(
                Icons.person_add,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Agregar Usuario',
              style: TextStyle(color: Colors.blue, fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //Nombre
                    Text(
                      'Nombre:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (value) => this._nombre = value,
                          autofocus: false,
                          validator: (value) => value.isEmpty
                              ? 'El Nombre no puede estar en blanco.'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Nombre',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //Apellido
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'Apellido:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (value) => _apellido = value,
                          autofocus: false,
                          validator: (value) => value.isEmpty
                              ? 'El Apellido no puede estar en blanco.'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Apellido',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //UserName
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'UserName:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (value) => _userName = value,
                          autofocus: false,
                          validator: (value) => value.isEmpty
                              ? 'El UserName no puede estar en blanco.'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'UserName',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //Email
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'Email:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) => _email = value,
                          autofocus: false,
                          validator: (value) => value.isEmpty
                              ? 'El Email no puede estar en blanco.'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //Contraseña
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'Contraseña:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          validator: (value) => value.isEmpty
                              ? 'La Contraseña no puede estar en blanco.'
                              : null,
                          onSaved: (value) => _password = value,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //Confirmar Contraseña
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'Confirmar Contraseña:',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          validator: (value) => value.isEmpty
                              ? 'La Contraseña no Puede Estar Vacia'
                              : null,
                          onSaved: (value) => _passwordConfirm = value,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          )),
                    ),
                    //Boton de Actualizar
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.pink,
                          child: Text(
                            'Agregar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
