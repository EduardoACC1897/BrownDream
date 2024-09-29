import 'package:flutter/material.dart';
import 'home_page.dart'; // Asegúrate de importar las páginas que creaste
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
    HomePage(title: 'Home'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex], // Cambia la pantalla según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
        selectedItemColor: Colors.brown[800], // Cambia el color del ítem seleccionado
        onTap: _onItemTapped, // Cambia el índice cuando se toca un ítem
      ),
    );
  }
}
