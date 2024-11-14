import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '/models/receta.dart';
import 'receta_detail_page.dart';

// Página Recetas
class MiBaristaPage extends StatefulWidget {
  const MiBaristaPage({super.key, required this.title});

  final String title;

  @override
  State<MiBaristaPage> createState() => _MiBaristaPageState();
}

class _MiBaristaPageState extends State<MiBaristaPage> {
  // Controlador para la búsqueda
  final TextEditingController _searchController = TextEditingController();
  // Lista de recetas
  List<Receta> recetas = [];

  List<Receta> filteredRecetas = []; // Lista filtrada de recetas

  @override
  void initState() {
    super.initState();
    _loadRecetas(); // Cargar las recetas al inicio
    filteredRecetas = recetas; // Inicialmente mostrar todas las recetas
    _searchController.addListener(_filterRecetas); // Escuchar cambios en el controlador
  }

  @override
  void dispose() {
    _searchController.dispose(); // Limpiar el controlador al destruir el widget
    super.dispose();
  }

  void _filterRecetas() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredRecetas = recetas.where((receta) {
        return receta.nombre.toLowerCase().contains(query); // Filtrar por nombre
      }).toList();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C),
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Buscar recetas',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true, // Para llenar el fondo del TextField
                        fillColor: Color(0xFFCD966C),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // ListView para permitir el desplazamiento
              child: ListView(
                children: filteredRecetas.map((receta) {
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de detalles al tocar cualquier parte de la tarjeta
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
                          Image.asset(
                            receta.imagen,
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                          ),
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
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}