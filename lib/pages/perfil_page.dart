import 'package:flutter/material.dart';
import '/models/usuario.dart';
import 'perfil_detail_page.dart'; // Importar la nueva pantalla

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
          ],
        ),
      ),
    );
  }
}
