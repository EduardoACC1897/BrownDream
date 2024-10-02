import 'package:flutter/material.dart';
import '/models/usuario.dart';

// Página PerfilDetail
class PerfilDetailPage extends StatelessWidget {
  final Usuario usuario;

  const PerfilDetailPage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color(0xFF8D4925),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFFCD966C),
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
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    usuario.editarPerfil(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8D4925),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Guardar cambios'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
