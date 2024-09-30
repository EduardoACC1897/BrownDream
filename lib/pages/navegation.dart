import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'recetas_page.dart';
import 'perfil_page.dart';

class Navegation extends StatefulWidget {
  const Navegation({super.key, required this.title});

  final String title;

  @override
  State<Navegation> createState() => _NavegationState();
}

class _NavegationState extends State<Navegation> {
  int _selectedIndex = 0;

  // Lista de las páginas que se mostrarán en el BottomNavigationBar
  static const List<Widget> _pages = <Widget>[
    InicioPage(title: 'Home'),
    RecetasPage(title: 'Recetas'),
    PerfilPage(title: 'Perfil'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8D4925),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _pages[_selectedIndex],

      // Implementación del BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF8D4925),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Establece el índice actual
        selectedItemColor: Colors.white, // Color del ítem seleccionado
        onTap: _onItemTapped, // Establece el nuevo índice cuando se presiona un ítem
      ),
    );
  }
}
