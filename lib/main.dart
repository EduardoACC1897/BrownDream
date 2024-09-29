import 'package:flutter/material.dart';
import 'pages/main_screen.dart'; // Asegúrate de importar el archivo que contiene MainScreen

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MainScreen(title: 'BrownDream'), // Establece MainScreen como la página inicial
    );
  }
}

