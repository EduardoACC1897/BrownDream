import 'package:flutter/material.dart';
import 'pages/navegation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrownDream',
      theme: ThemeData(
        fontFamily: 'Nunito', // Fuente global para la App
        useMaterial3: true,
      ),
      home: const Navegation(title: 'BrownDream'), // MainScreen como la página inicial
    );
  }
}
