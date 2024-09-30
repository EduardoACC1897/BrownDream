import 'package:flutter/material.dart';
import '/models/receta.dart';

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
              color: const Color(0xFF8D4925), // Color de fondo de la tarjeta
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título con el autor y la fecha
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comentario.autor,
                          style: const TextStyle(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          fechaHoraMinuto, // Muestra solo la fecha y hora sin segundos
                          style: const TextStyle(
                            color: Colors.white70, // Color del texto de la fecha
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
                        color: Colors.white, // Color del texto del comentario
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
