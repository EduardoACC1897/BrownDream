import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'mi_barista_page.dart';
import 'mis_recetas_page.dart';
import 'opinion_page.dart';

// Página Navegation
class Navegation extends StatefulWidget {
  const Navegation({super.key, required this.title});

  final String title;

  @override
  State<Navegation> createState() => _NavegationState();
}

class _NavegationState extends State<Navegation> {
  int _selectedIndex = 0;

  // Método que cambia la pestaña
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget que construye la página seleccionada
  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return const InicioPage(title: 'Home');
      case 1:
        return const MiBaristaPage(title: 'Mi Barista');
      case 2:
        return const MisRecetasPage(title: 'Mis Recetas');
      case 3:
        return const OpinionPage(title: 'Opinión');
      default:
        return const InicioPage(title: 'Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Quitar el foco de cualquier TextField al tocar la pantalla
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5C2A16),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: _buildPage(), // Solo muestra la página seleccionada
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF5C2A16),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_cafe),
              label: 'Mi Barista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mis Recetas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Opinión',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
