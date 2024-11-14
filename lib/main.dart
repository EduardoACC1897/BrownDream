import 'package:flutter/material.dart';
import 'pages/navegation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar y guardar las recetas en SharedPreferences
  await loadAndSaveRecipes();

  runApp(const MyApp());
}

Future<void> loadAndSaveRecipes() async {
  try {
    // Cargar el archivo JSON desde los assets
    final String response = await rootBundle.loadString('assets/json/recetas.json');
    
    // Decodificar el JSON completo
    final Map<String, dynamic> data = jsonDecode(response);

    // Verificar que el JSON no esté vacío
    if (data.isNotEmpty) {
      print('Recetas cargadas: ${data.keys}');

      // Convertir las recetas en una lista de mapas
      List<Map<String, dynamic>> recetas = [];

      // Iterar sobre cada receta para extraer sus datos
      data.forEach((key, value) {
        // Aquí, cada `value` es la receta con todos sus campos (id, nombre, ingredientes, etc.)
        recetas.add(value);
        
        // Imprimir cada receta por separado
        print('Receta: $key');
        value.forEach((recetaKey, recetaValue) {
          print('$recetaKey: $recetaValue');
        });
        print('---------------------------');
      });

      // Guardar las recetas en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('recetas', jsonEncode(recetas));  // Guardar las recetas como una lista JSON

      print('Recetas guardadas en SharedPreferences:');
      // Imprimir las recetas de nuevo, clave por clave
      recetas.forEach((receta) {
        receta.forEach((key, value) {
          print('$key: $value');
        });
        print('---------------------------');
      });
    } else {
      print('Error: El JSON está vacío o no contiene recetas.');
    }
  } catch (e) {
    print('Error al cargar o guardar las recetas: $e');
  }
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
