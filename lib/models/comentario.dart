import 'package:flutter/material.dart';

// Clase Comentario
class Comentario {
  final String _id;
  final String _autor;
  final String _texto; 
  final DateTime _fechaCreacion;

  Comentario({
    required String id,
    required String texto,
    required String autor,
    required DateTime? fechaCreacion,
  })  : _id = id,
        _texto = texto,
        _autor = autor,
        _fechaCreacion = fechaCreacion ?? DateTime.now();

  String get id => _id;
  String get texto => _texto;
  String get autor => _autor;
  DateTime get fechaCreacion => _fechaCreacion;

  void modificarComentario(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Comentario modificado'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
