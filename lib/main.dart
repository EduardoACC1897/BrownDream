import 'package:flutter/material.dart';
import 'pages/main_screen.dart';

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
      home: const MainScreen(title: 'BrownDream'), // MainScreen como la página inicial
    );
  }
}
