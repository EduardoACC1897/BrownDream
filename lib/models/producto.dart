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

  // Método fromMap para convertir un mapa en una instancia de Producto
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'] ?? '', // Usa un valor por defecto vacío si la clave no existe
      imagen: map['imagen'] ?? '',
      nombre: map['nombre'] ?? '',
      tipo: map['tipo'] ?? '',
      descripcion: map['descripcion'] ?? '',
    );
  }

}