import 'package:flutter/material.dart';
import '/models/receta.dart';

// Página de Comentario
class ComentarioPage extends StatelessWidget {
  final Receta receta;

  const ComentarioPage({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comentarios de ${receta.nombre}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8D4925),
      ),
      body: Container(
        color: const Color(0xFFCD966C),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: receta.comentarios.length,
          itemBuilder: (context, index) {
            final comentario = receta.comentarios[index];

            // Ajuste en el formato de la fecha para mostrar solo año-mes-día hora:minuto
            final String fechaHoraMinuto = 
              '${comentario.fechaCreacion.year}-${comentario.fechaCreacion.month.toString().padLeft(2, '0')}-${comentario.fechaCreacion.day.toString().padLeft(2, '0')} '
              '${comentario.fechaCreacion.hour.toString().padLeft(2, '0')}:${comentario.fechaCreacion.minute.toString().padLeft(2, '0')}';

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: const Color(0xFF8D4925),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título con el autor y la fecha, y los iconos de editar/borrar si es el propietario
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              comentario.autor,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            // Si el comentario es del propietario, mostrar los íconos
                            if (comentario.autor == 'Eduardo Cabezas')
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.white),
                                    onPressed: () {
                                      comentario.modificarComentario(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.white),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Comentario borrado'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                        Text(
                          fechaHoraMinuto, // Muestrar solo la fecha, hora y minutos
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // Texto del comentario
                    Text(
                      comentario.texto,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
