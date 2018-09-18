import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> iniciarSesion(String email, String contrasena);
  Future<String> currentUser();
  Future<void> cerrarSesion();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> iniciarSesion(String email, String contrasena) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: contrasena);
    return user.email;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> cerrarSesion() async {
    return _firebaseAuth.signOut();
  }
}
