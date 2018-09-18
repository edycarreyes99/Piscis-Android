import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthState { noIniciado, iniciado }

class _RootPageState extends State<RootPage> {
  AuthState _authState = AuthState.noIniciado;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userid) {
      setState(() {
        _authState = userid == null ? AuthState.noIniciado : AuthState.iniciado;
      });
    });
  }

  void iniciado() {
    setState(() {
      _authState = AuthState.iniciado;
    });
  }

  void noIniciado() {
    setState(() {
      _authState = AuthState.noIniciado;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authState) {
      case AuthState.noIniciado:
        return new LoginPage(
          auth: widget.auth,
          onIniciado: iniciado,
        );
      case AuthState.iniciado:
        return new HomePage(
          auth: widget.auth,
          onCerrarSesion: noIniciado,
        );
    }
    return LoginPage(
      auth: widget.auth,
    );
  }
}
