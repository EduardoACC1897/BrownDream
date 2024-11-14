import 'package:flutter/material.dart';
import '/models/receta.dart';
import 'receta_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Página Inicio
class InicioPage extends StatefulWidget {
  const InicioPage({super.key, required this.title});

  final String title;

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  // Lista de recetas
  List<Receta> recetas = [];

  List<Receta> filteredRecetas = []; // Lista filtrada de recetas

  List<String> nombresRecetas = []; // Lista de nombres de recetas guardados en SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadRecetas(); // Cargar las recetas al inicio
    _loadNombresRecetas(); // Cargar los nombres de SharedPreferences al iniciar
    filteredRecetas = recetas; // Inicialmente mostrar todas las recetas
  }

  // Cargar las recetas desde SharedPreferences
  Future<void> _loadRecetas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? recetasJson = prefs.getString('recetas'); // Obtener el JSON de las recetas

    if (recetasJson != null) {
      List<dynamic> recetasList = jsonDecode(recetasJson);

      setState(() {
        recetas = recetasList.map((recetaMap) {
          return Receta.fromMap(recetaMap); // Convertir cada mapa a un objeto Receta
        }).toList();
        filteredRecetas = recetas; // Inicialmente mostrar todas las recetas
      });

      print('Recetas cargadas mi_barista: $recetas');
    } else {
      print('No se encontraron recetas guardadas.');
    }
  }
  
  // Función para cargar los nombres de recetas desde SharedPreferences
  Future<void> _loadNombresRecetas() async {
    final prefs = await SharedPreferences.getInstance();
    nombresRecetas = prefs.getStringList('nombresRecetas') ?? [];
    
    // Filtrar recetas para mostrar solo las que coinciden con los nombres de SharedPreferences
    setState(() {
      filteredRecetas = recetas.where((receta) => nombresRecetas.contains(receta.nombre)).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/icons/inicio_icon.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Últimas recetas visitadas',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            
            // Línea decorativa debajo del título
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              width: 320, // Ancho de la línea
              height: 5, // Grosor de la línea
              color: const Color(0xFF8D4925), // Color de la línea
            ),
            
            const SizedBox(height: 10),

            // Contenido de recetas o mensaje de vacío
            Expanded(
              child: filteredRecetas.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Todavía no visitaste ninguna receta.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 30),
                      itemCount: filteredRecetas.length,
                      itemBuilder: (context, index) {
                        final receta = filteredRecetas.reversed.toList()[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecetaDetailPage(
                                  receta: receta,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.all(8.0),
                            color: const Color(0xFF8D4925),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        receta.nombre,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    receta.descripcion,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
