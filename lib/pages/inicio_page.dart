import 'package:flutter/material.dart';

// Página Inicio
class InicioPage extends StatelessWidget {
  const InicioPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C), // Color de fondo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icono grande
              Image.asset(
                'assets/icons/inicio_icon.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
