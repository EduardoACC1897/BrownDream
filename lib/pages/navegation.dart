import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'recetas_page.dart';
import 'perfil_page.dart';

// Página Navegation
class Navegation extends StatefulWidget {
  const Navegation({super.key, required this.title});

  final String title;

  @override
  State<Navegation> createState() => _NavegationState();
}

class _NavegationState extends State<Navegation> {
  int _selectedIndex = 0;

  // Claves para los navegadores anidados de cada pestaña
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  // Lista de las páginas principales del BottomNavigationBar
  static const List<Widget> _pages = <Widget>[
    InicioPage(title: 'Home'),
    RecetasPage(title: 'Recetas'),
    PerfilPage(title: 'Perfil'),
  ];

  // Método que cambia la pestaña y limpia el historial de la pestaña actual
  void _onItemTapped(int index) {
    FocusScope.of(context).unfocus(); // Quitar el foco de cualquier TextField antes de cambiar de pestaña
    if (_selectedIndex != index) {
      _navigatorKeys[_selectedIndex].currentState?.popUntil((route) => route.isFirst);
      setState(() {
        _selectedIndex = index;
      });
    } else {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    }
  }

  // Widget que construye el Navigator anidado para cada pestaña
  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => _pages[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Quitar el foco de cualquier TextField al tocar la pantalla
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF8D4925),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        // Offstage para mantener todos los Navigators pero solo mostrar el seleccionado
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
