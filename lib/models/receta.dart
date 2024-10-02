import 'package:flutter/material.dart';
import 'comentario.dart';
import 'producto.dart';

// Clase Receta
class Receta {
  final String _id;
  final String _propietario;
  final String _imagen;
  final double _calificacionPromedio;
  final String _nombre;
  final String _descripcion;
  final String _tecnicaExtraccion;
  final int _tiempoPreparacion;
  final String _tipoGrano;
  final List<String> _ingredientes;
  final List<String> _guiaPreparacion;
  final List<Comentario> _comentarios;
  final List<Producto> _productosRecomendados;
  bool _favorito;
  final bool _publicado;

  Receta({
    required String id,
    required String propietario,
    required String imagen,
    required double calificacionPromedio,
    required String nombre,
    required String descripcion,
    required String tecnicaExtraccion,
    required int tiempoPreparacion,
    required String tipoGrano,
    required List<String> guiaPreparacion,
    required List<String> ingredientes,
    List<Comentario>? comentarios,
    List <Producto> productosRecomendados  = const [],
    bool favorito = false,
    bool publicado = false,
  })  : _id = id,
        _imagen = imagen,
        _propietario = propietario,
        _calificacionPromedio = calificacionPromedio,
        _nombre = nombre,
        _descripcion = descripcion,
        _tecnicaExtraccion = tecnicaExtraccion,
        _tiempoPreparacion = tiempoPreparacion,
        _tipoGrano = tipoGrano,
        _guiaPreparacion = guiaPreparacion,
        _ingredientes = ingredientes,
        _comentarios = comentarios ?? [],
        _productosRecomendados = productosRecomendados,
        _favorito = favorito,
        _publicado = publicado;   

  String get id => _id;
  String get propietario => _propietario;
  String get imagen => _imagen;
  double get calificacionPromedio => _calificacionPromedio;
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  String get tecnicaExtraccion => _tecnicaExtraccion;
  int get tiempoPreparacion => _tiempoPreparacion;
  String get tipoGrano => _tipoGrano;
  List<String> get guiaPreparacion => List.unmodifiable(_guiaPreparacion);
  List<String> get ingredientes => List.unmodifiable(_ingredientes);
  List<Comentario> get comentarios => List.unmodifiable(_comentarios);
  List<Producto> get productosRecomendados => List.unmodifiable(_productosRecomendados);
  bool get favorito => _favorito;
  bool get publicado => _publicado;

// Métodos para mostrar un mensaje de que se añadió la receta a favoritos
  void marcarFavorito(BuildContext context) {
    _favorito = true;
    final snackBar = SnackBar(
      content: Text('Receta "$_nombre" añadida a favoritos'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Métodos para mostrar un mensaje de que se quitó la receta a favoritos
  void quitarFavorito(BuildContext context) {
    _favorito = false;
    final snackBar = SnackBar(
      content: Text('Receta "$_nombre" eliminada de favoritos'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Método para mostrar un mensaje de que la receta se compartió
  void compartirReceta(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Receta "$nombre" compartida'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Método para mostrar un mensaje de que la receta se calificó
  void calificarReceta(BuildContext context, int calificacion) {
    final snackBar = SnackBar(
      content: Text('Receta "$_nombre" calificada con $calificacion estrellas'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
