import 'package:flutter/material.dart';

// Clase Producto
class Producto {
  final String _id;
  final String _imagen;
  final String _nombre;
  final String _tipo; 
  final String _descripcion;

  Producto({
    required String id,
    required String imagen,
    required String nombre,
    required String tipo,
    required String descripcion,
  })  : _id = id,
        _imagen = imagen,
        _nombre = nombre,
        _tipo = tipo,
        _descripcion = descripcion;

  String get id => _id;
  String get imagen => _imagen;
  String get nombre => _nombre;
  String get tipo => _tipo;
  String get descripcion=> _descripcion;

  // Métodos para mostrar un mensaje de que se abrió un enlace al producto
  void enlaceProducto(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Abriendo enlace al producto'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}