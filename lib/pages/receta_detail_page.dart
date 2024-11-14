import 'package:flutter/material.dart';
import '/models/receta.dart';
import 'producto_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

// Página RecetaDetail
class RecetaDetailPage extends StatefulWidget {
  final Receta receta;

  // Constructor que recibe la receta y el callback
  const RecetaDetailPage({
    super.key,
    required this.receta,
  });

  @override
  State<RecetaDetailPage> createState() => _RecetaDetailPageState();
}

class _RecetaDetailPageState extends State<RecetaDetailPage> {
 
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _seconds = 0;
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  Future<void> _actualizarDatosReceta() async {
    final prefs = await SharedPreferences.getInstance();

    // Recuperar las recetas guardadas
    String? recetasJson = prefs.getString('recetas');

    if (recetasJson != null) {
      // Decodificar las recetas guardadas
      List<dynamic> recetasList = jsonDecode(recetasJson);

      // Buscar la receta con el mismo id que widget.receta.id
      for (var recetaMap in recetasList) {
        var receta = Receta.fromMap(recetaMap);

        if (receta.id == widget.receta.id) {
          // Si encontramos la receta, primero recuperamos el valor de vecesPreparada
          int vecesPreparadaAlmacenada = prefs.getInt('${receta.id}-vecesPreparada') ?? 0;
          
          // Incrementar el valor de vecesPreparada
          int nuevasVecesPreparada = vecesPreparadaAlmacenada + 1;

          String nuevaFecha = DateTime.now().toIso8601String();

          // Guardar los nuevos valores directamente en SharedPreferences
          await prefs.setInt('${receta.id}-vecesPreparada', nuevasVecesPreparada);
          await prefs.setString('${receta.id}-fechaUltimaPreparacion', nuevaFecha);

          // Actualizar el widget
          setState(() {
            widget.receta.incrementarVecesPreparada();
            widget.receta.actualizarFechaUltimaPreparacion();
          });

          break; // Salimos del bucle después de encontrar y actualizar la receta
        }
      }
    } else {
      print('No se encontraron recetas guardadas.');
    }
  }

  void _toggleTimer() {
    if (_isRunning) {
      _stopTimer();
    } else {
      _resetTimer();
      _actualizarDatosReceta(); // Actualizar SharedPreferences y la receta
    }
  }

 void _compartirReceta() {
  final String contenido = '''
      ${widget.receta.nombre}\n\n
      ${widget.receta.descripcion}\n\n
      Técnica de Preparación: ${widget.receta.tecnicaExtraccion}\n
      Tiempo de Preparación: ${widget.receta.tiempoPreparacion} minutos\n
      Tipo de Grano: ${widget.receta.tipoGrano}\n\n
      Ingredientes:\n
      ${widget.receta.ingredientes.join("\n")}\n\n
      Guía de Preparación:\n
      ${widget.receta.guiaPreparacion.join("\n")}
    ''';

    // Usar el paquete share_plus para compartir el contenido
  Share.share(contenido);
  }

  // Guardar el nombre de la receta en SharedPreferences
  _guardarNombreReceta() async {
    final prefs = await SharedPreferences.getInstance();
    // Recuperar la lista de nombres de recetas ya guardados
    List<String> nombresRecetas = prefs.getStringList('nombresRecetas') ?? [];

    // Si ya hay 3 nombres guardados, eliminar el más antiguo
    if (nombresRecetas.length >= 3) {
      nombresRecetas.removeLast(); // Elimina el nombre más antiguo (última posición)
    }

    // Verificar si el nombre ya está en alguna posición
    if (nombresRecetas.contains(widget.receta.nombre)) {
      // Si el nombre está en la posición 2 o 3, desplazarlo a la posición 1
      nombresRecetas.remove(widget.receta.nombre);
      nombresRecetas.insert(0, widget.receta.nombre);
    } else {
      // Si el nombre no está en la lista, agregarlo en la posición 1
      nombresRecetas.insert(0, widget.receta.nombre);
    }

    // Guardar la lista actualizada en SharedPreferences
    await prefs.setStringList('nombresRecetas', nombresRecetas);
  }

  @override
  void initState() {
    super.initState();
    _guardarNombreReceta(); // Guardar el nombre al entrar en la pantalla
    _timer = Timer(Duration.zero, () {}); // Inicializar _timer con un Timer inactivo
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Método para formatear la fecha desde una cadena en formato ISO 8601
String _formatDate(String fecha) {
  try {
    DateTime dateTime = DateTime.parse(fecha); // Convertir la cadena a DateTime
    return '${dateTime.day.toString().padLeft(2, '0')}/'
           '${dateTime.month.toString().padLeft(2, '0')}/'
           '${dateTime.year}';
  } catch (e) {
    // Si la fecha no se puede parsear correctamente, devolver un valor por defecto
    return 'Fecha inválida';
  }
}

 @override
  Widget build(BuildContext context) {
  // Verificar si fechaUltimaPreparacion es nulo y formatearlo si no lo es
  final String formattedFechaUltimaPreparacion = widget.receta.fechaUltimaPreparacion != null
      ? _formatDate(widget.receta.fechaUltimaPreparacion!)
      : 'No disponible';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.receta.nombre,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8D4925),
      ),
      body: Container(
        color: const Color(0xFF8D4925),
        padding: const EdgeInsets.all(16.0),
        // ListView para permitir el desplazamiento
        child: ListView(
          children: [
            // Imagen de la receta
            Image.asset(
              widget.receta.imagen,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [               
              // Botón de temporizador
                IconButton(
                  icon: Icon(
                    _isRunning ? Icons.pause : Icons.access_time,
                    color: Colors.white,
                  ),
                  onPressed: _toggleTimer,
                ),
                // Mostrar el tiempo transcurrido en formato mm:ss
                Text(
                  '${(_seconds ~/ 60).toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              // Botón de compartir
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    // Llama al método de compartir
                    _compartirReceta();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),           
            // Texto y valor de cantidad de veces preparada
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cantidad de veces preparada la receta:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${widget.receta.vecesPreparada}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Texto y valor de la fecha de última preparación
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fecha de última preparación:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  formattedFechaUltimaPreparacion,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Comprobar si el propietario no es "SYSTEM" antes de mostrar el mensaje
            if (widget.receta.propietario != "SYSTEM") ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Texto que muestra el propietario
                  Text(
                    'Creada por: ${widget.receta.propietario}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if(widget.receta.propietario == "USER") ...{
                    // Botón de editar
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Acción al presionar el icono de editar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editando receta')),
                        );
                      },
                    ),
                    // Botón  de borrar
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        // Acción al presionar el icono de borrar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Receta borrada')),
                        );
                      },
                    ),
                  }
                ],
              ),
            ],
            const SizedBox(height: 16.0),
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.descripcion,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Técnica de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tecnicaExtraccion,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tiempo de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${widget.receta.tiempoPreparacion} minutos',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tipo de Grano',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tipoGrano,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredientes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.ingredientes.map((ingrediente) => Text(
              '- $ingrediente',
              style: const TextStyle(color: Colors.white),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Guía de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.guiaPreparacion.map((paso) => Text(
              '- $paso',
              style: const TextStyle(color: Colors.white),
            )),
            const SizedBox(height: 16.0),
            // Mostrar recetas recomendadas
            const Text(
              'Producto Recomendadas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
              if (widget.receta.productosRecomendados.isNotEmpty) ...[
                ...widget.receta.productosRecomendados.map((producto) => ListTile(
                  title: Text(producto.nombre, style: const TextStyle(color: Colors.white)),
                  subtitle: Text('Tipo: ${producto.tipo}', style: const TextStyle(color: Colors.white)),
                  leading: Image.asset(producto.imagen, width: 50, height: 50, fit: BoxFit.cover),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductoPage(
                          producto: producto,
                        ),
                      ),
                    );
                  },
                )),
              ] else ...[
                const Text(
                  'No hay productos recomendados.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
              const SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Receta creada')),
          );
        },
          backgroundColor: const Color(0xFFCD966C),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
      ),
    );
  }
}