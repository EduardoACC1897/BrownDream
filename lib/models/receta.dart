import 'producto.dart';

// Clase Receta
class Receta {
  final String _id;
  final String _propietario;
  final String _imagen;
  final String _nombre;
  final String _descripcion;
  final String _tecnicaExtraccion;
  final int _tiempoPreparacion;
  final String _tipoGrano;
  final List<String> _ingredientes;
  final List<String> _guiaPreparacion;
  final List<Producto> _productosRecomendados;
  String? _vecesPreparada;
  String? _fechaUltimaPreparacion;

  Receta({
    required String id,
    required String propietario,
    required String imagen,
    required String nombre,
    required String descripcion,
    required String tecnicaExtraccion,
    required int tiempoPreparacion,
    required String tipoGrano,
    required List<String> ingredientes,
    required List<String> guiaPreparacion,
    List<Producto> productosRecomendados = const [],
    String? vecesPreparada,
    String? fechaUltimaPreparacion,
  })  : _id = id,
        _propietario = propietario,
        _imagen = imagen,
        _nombre = nombre,
        _descripcion = descripcion,
        _tecnicaExtraccion = tecnicaExtraccion,
        _tiempoPreparacion = tiempoPreparacion,
        _tipoGrano = tipoGrano,
        _ingredientes = ingredientes,
        _guiaPreparacion = guiaPreparacion,
        _productosRecomendados = productosRecomendados,
        _vecesPreparada = vecesPreparada,
        _fechaUltimaPreparacion = fechaUltimaPreparacion;

  String get id => _id;
  String get propietario => _propietario;
  String get imagen => _imagen;
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  String get tecnicaExtraccion => _tecnicaExtraccion;
  int get tiempoPreparacion => _tiempoPreparacion;
  String get tipoGrano => _tipoGrano;
  List<String> get ingredientes => List.unmodifiable(_ingredientes);
  List<String> get guiaPreparacion => List.unmodifiable(_guiaPreparacion);
  List<Producto> get productosRecomendados => List.unmodifiable(_productosRecomendados);
  String? get vecesPreparada => _vecesPreparada;
  String? get fechaUltimaPreparacion => _fechaUltimaPreparacion;

  // Métodos para modificar las variables
  void incrementarVecesPreparada() {
    if (_vecesPreparada != null) {
      int veces = int.tryParse(_vecesPreparada!) ?? 0;
      _vecesPreparada = (veces + 1).toString();
    }
  }

  void actualizarFechaUltimaPreparacion() {
    // Guardamos la fecha como String en el formato ISO 8601
    _fechaUltimaPreparacion = DateTime.now().toIso8601String();
  }

  // Método fromMap para convertir un mapa en una instancia de Receta
  factory Receta.fromMap(Map<String, dynamic> map) {
    return Receta(
      id: map['id'] ?? '', // Usa un valor predeterminado si no existe la clave
      propietario: map['propietario'] ?? '',
      imagen: map['imagen'] ?? '',
      nombre: map['nombre'] ?? '',
      descripcion: map['descripcion'] ?? '',
      tecnicaExtraccion: map['tecnicaExtraccion'] ?? '',
      tiempoPreparacion: map['tiempoPreparacion'] ?? 0,
      tipoGrano: map['tipoGrano'] ?? '',
      ingredientes: List<String>.from(map['ingredientes'] ?? []),
      guiaPreparacion: List<String>.from(map['guiaPreparacion'] ?? []),
      productosRecomendados: List<Producto>.from(map['productosRecomendados']?.map((x) => Producto.fromMap(x)) ?? []),
      vecesPreparada: map['vecesPreparada'], // Puede ser nulo
      fechaUltimaPreparacion: map['fechaUltimaPreparacion'], // Puede ser nulo
    );
  }

}
