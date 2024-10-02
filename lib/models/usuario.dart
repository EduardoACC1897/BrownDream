import 'package:flutter/material.dart';

// Clase Usuario
class Usuario {
  final String _id; 
  final String _nombre;
  final String _genero; 
  final String _pais;
  final String _email;
  final String _contrasena;
  final String _fotoPerfil;
  final List<String> _preferencias;

  Usuario({
    required String id, 
    required String nombre,
    required String genero, 
    required String pais,
    required String email,
    required String contrasena,
    required String fotoPerfil,
    List<String>? preferencias,
  })  : _id = id,
        _nombre = nombre,
        _genero = genero,
        _pais = pais,
        _email = email,
        _contrasena = contrasena,
        _fotoPerfil = fotoPerfil,
        _preferencias = preferencias ?? [];

  String get id => _id;
  String get nombre => _nombre;
  String get genero => _genero;
  String get pais => _pais;
  String get email => _email;
  String get contrasena => _contrasena;
  String get fotoPerfil => _fotoPerfil;
  List<String> get preferencias => _preferencias;

  // Método para mostrar un mensaje de que el usuario edito su perfil
  void editarPerfil(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Cambios guardados'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
