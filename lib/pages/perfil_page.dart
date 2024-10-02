import 'package:flutter/material.dart';
import '/models/usuario.dart';
import 'perfil_detail_page.dart';
import 'favoritos_page.dart';
import 'mis_recetas_page.dart';
import 'mis_comentarios_page.dart';

// Página Perfil
class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key, required this.title});

  final String title;

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final Usuario _usuario = Usuario(
    id: '1',
    nombre: 'Eduardo Cabezas',
    genero: 'Masculino',
    pais: 'Chile',
    email: 'eduardoc@example.com',
    contrasena: 'password123',
    fotoPerfil: 'assets/icons/perfil_icon.png',
    preferencias: ['Arábica', 'Máquina de espresso', 'Hojas de Menta Fresca'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_usuario.fotoPerfil),
            ),
            const SizedBox(height: 16),
            Text(
              _usuario.nombre,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _usuario.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  _usuario.pais,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navegar a la nueva pantalla de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilDetailPage(usuario: _usuario)),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Editar Perfil',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8D4925),
              ),
            ),
            const SizedBox(height: 40),
            // Botones de acciones
            Column(
              children: [
                // Botón "Favoritos"
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritosPage(usuario: _usuario)),
                    );
                  },
                  icon: const Icon(Icons.favorite, color: Colors.white, size: 32),
                  label: const Text(
                    'Favoritos',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8D4925),
                    minimumSize: const Size.fromHeight(70),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),
                // Botón "Mis Recetas"
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MisRecetasPage(usuario: _usuario,)),
                    );
                  },
                  icon: const Icon(Icons.receipt, color: Colors.white, size: 32),
                  label: const Text(
                    'Mis Recetas',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8D4925),
                    minimumSize: const Size.fromHeight(70),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),
                // Botón "Mis Comentarios"
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MisComentariosPage(usuario: _usuario)),
                    );
                  },
                  icon: const Icon(Icons.comment, color: Colors.white, size: 32),
                  label: const Text(
                    'Mis Comentarios',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8D4925),
                    minimumSize: const Size.fromHeight(70),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
