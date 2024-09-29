import 'package:flutter/material.dart';
import 'inicio_page.dart'; // Asegúrate de importar las páginas que creaste
import 'recetas_page.dart';
import 'perfil_page.dart';

class MainScreen extends StatefulWidget { // Cambio de MyHomePage a MainScreen
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState(); // Cambio del nombre del estado
}

class _MainScreenState extends State<MainScreen> { // Cambio del nombre del estado
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
          style: const TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
      body: _pages[_selectedIndex], // Cambia la pantalla según el índice seleccionado

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
        selectedItemColor: const Color(0xFFFFFFFF), // Color del ítem seleccionado
        onTap: _onItemTapped, // Establece el nuevo índice cuando se presiona un ítem
      ),
    );
  }
}
