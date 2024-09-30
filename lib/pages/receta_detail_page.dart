import 'package:flutter/material.dart';
import '/models/receta.dart';

// Página RecetaDetail
class RecetaDetailPage extends StatefulWidget {
  final Receta receta;
  final Function onFavoritoToggle; // Callback para actualizar el favorito

  // Constructor que recibe la receta y el callback
  const RecetaDetailPage({
    super.key,
    required this.receta,
    required this.onFavoritoToggle, // Inicializa el callback
  });

  @override
  State<RecetaDetailPage> createState() => _RecetaDetailPageState();
}

class _RecetaDetailPageState extends State<RecetaDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.receta.nombre,
          style: const TextStyle(color: Colors.white), // Color blanco para el texto del título
        ),
        backgroundColor: const Color(0xFF8D4925), // Color de la AppBar
      ),
      body: Container(
        color: const Color(0xFF8D4925), // Color de fondo
        padding: const EdgeInsets.all(16.0),
        // Usar ListView para permitir el desplazamiento
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
            // Calificación y estrella, botón de calificar, botón de comentarios y botón de favoritos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.receta.calificacionPromedio.toString(),
                      style: const TextStyle(color: Colors.white), // Color blanco para el texto
                    ),
                    const Icon(Icons.star, color: Colors.amber), // Color ambar para la estrella
                  ],
                ),
                // Botón de calificar
                ElevatedButton(
                  onPressed: () {
                    // Llama a la función de calificar de la receta
                    widget.receta.calificarReceta(context, 5);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCD966C), // Color del botón
                  ),
                  child: const Text(
                    'Calificar',
                    style: TextStyle(color: Colors.white), // Color del texto
                  ),
                ),
                // Botón de comentarios
                ElevatedButton(
                  onPressed: () {
                    // Acción de comentarios
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Comentario agregado')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCD966C), // Color del botón
                  ),
                  child: const Text(
                    'Comentarios',
                    style: TextStyle(color: Colors.white), // Color del texto
                  ),
                ),
                // Botón de favoritos
                IconButton(
                  icon: Icon(
                    widget.receta.favorito ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white, // Color del corazón
                  ),
                  onPressed: () {
                    // Cambiar el estado de favorito
                    setState(() {
                      if (widget.receta.favorito) {
                        widget.receta.quitarFavorito(context); // Usar método para quitar de favoritos
                      } else {
                        widget.receta.marcarFavorito(context); // Usar método para marcar como favorito
                      }
                    });
                    widget.onFavoritoToggle(); // Llama al callback para actualizar el estado
                  },
                ),
                // Botón de compartir
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white), // Ícono de compartir
                  onPressed: () {
                    // Acción al compartir la receta
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Receta compartida')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Información adicional de la receta
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.descripcion,
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Técnica de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tecnicaExtraccion,
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tiempo de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${widget.receta.tiempoPreparacion} minutos',
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tipo de Grano',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tipoGrano,
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredientes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.ingredientes.map((ingrediente) => Text(
              '- $ingrediente',
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Guía de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.guiaPreparacion.map((paso) => Text(
              '- $paso',
              style: const TextStyle(color: Colors.white), // Color blanco para el texto
            )),
          ],
        ),
      ),
    );
  }
}