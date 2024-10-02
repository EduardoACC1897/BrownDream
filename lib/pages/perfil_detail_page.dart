import 'package:flutter/material.dart';
import '/models/usuario.dart';

class PerfilDetailPage extends StatelessWidget {
  final Usuario usuario;

  const PerfilDetailPage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Perfil'),
        backgroundColor: const Color(0xFF8D4925), // Color de fondo de la AppBar
        foregroundColor: Colors.white, // Color del texto en la AppBar
      ),
      body: Container(
        color: const Color(0xFFCD966C), // Color de fondo
        padding: const EdgeInsets.all(16.0),
        child: ListView( // Usar ListView para manejar el contenido
          children: [
            // Mostrar la información del usuario
            Text(
              'Nombre: ${usuario.nombre}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Género: ${usuario.genero}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'País: ${usuario.pais}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${usuario.email}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Contraseña: ${usuario.contrasena}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Mostrar la lista de preferencias
            const Text(
              'Preferencias:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            for (String preferencia in usuario.preferencias)
              Text(
                '• $preferencia',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 16),

            // Botón para guardar cambios
            Center( // Centrar el botón en la pantalla
              child: SizedBox(
                width: 200, // Ancho personalizado para el botón
                child: ElevatedButton(
                  onPressed: () {
                    usuario.editarPerfil(context);
                    Navigator.pop(context); // Volver a la página anterior
                  },
                  child: const Text('Guardar cambios'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8D4925), // Color marrón para el botón
                    foregroundColor: Colors.white, // Texto en blanco
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
