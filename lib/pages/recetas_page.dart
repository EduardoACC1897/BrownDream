import 'package:flutter/material.dart';
import '/models/receta.dart';
import 'receta_detail_page.dart';

// Página Receta
class RecetasPage extends StatefulWidget {
  const RecetasPage({super.key, required this.title});

  final String title;

  @override
  State<RecetasPage> createState() => _RecetasPageState();
}

class _RecetasPageState extends State<RecetasPage> {
  // Controlador para la búsqueda
  final TextEditingController _searchController = TextEditingController();
  // Lista de recetas
  List<Receta> recetas = [
    Receta(
      id: '1',
      nombre: 'Vanilla Latte',
      descripcion: 'Un delicioso y cremoso café que combina espresso con leche vaporizada y jarabe de vainilla, ideal para los amantes de los sabores dulces.',
      imagen: 'assets/images/vanilla_latte.png',
      calificacionPromedio: 4.8,
      tecnicaExtraccion: 'Máquina de espresso',
      tiempoPreparacion: 8,
      tipoGrano: 'Arábica',
      ingredientes: [
        '1 espresso (30 ml)',
        '240 ml de leche vaporizada',
        '30 ml de jarabe de vainilla',
        'Espuma de leche (opcional)',
      ],
      guiaPreparacion: [
        'Preparar un espresso en una taza grande.',
        'Calentar y vaporizar la leche hasta que esté espumosa.',
        'Añadir el jarabe de vainilla al espresso.',
        'Verter la leche vaporizada sobre el espresso y el jarabe.',
        'Agregar espuma de leche en la parte superior si lo deseas.',
      ],
      publicado: true,
    ),
    Receta(
      id: '2',
      nombre: 'Cappuccino',
      descripcion: 'Un clásico café italiano que mezcla espresso con partes iguales de leche vaporizada y espuma de leche, creando una textura cremosa y rica.',
      imagen: 'assets/images/cappuccino.png',
      calificacionPromedio: 4.5,
      tecnicaExtraccion: 'Máquina de espresso',
      tiempoPreparacion: 5,
      tipoGrano: 'Arábica',
      ingredientes: [
        '1 espresso (30 ml)',
        '60 ml de leche vaporizada',
        '60 ml de espuma de leche',
      ],
      guiaPreparacion: [
        'Preparar un espresso en una taza.',
        'Vaporizar la leche hasta que esté caliente y espumosa.',
        'Añadir la leche vaporizada sobre el espresso.',
        'Cubrir con espuma de leche.',
        'Espolvorear canela o cacao en polvo por encima si se desea.',
      ],
      publicado: true,
    ),
    Receta(
      id: '3',
      nombre: 'Americano',
      descripcion: 'Un café simple y fuerte que se prepara añadiendo agua caliente a un espresso, manteniendo su robustez y sabor característico.',
      imagen: 'assets/images/americano.png',
      calificacionPromedio: 4.2,
      tecnicaExtraccion: 'Máquina de espresso',
      tiempoPreparacion: 3,
      tipoGrano: 'Arábica',
      ingredientes: [
        '1 espresso (30 ml)',
        'Agua caliente (aproximadamente 180 ml)',
      ],
      guiaPreparacion: [
        'Preparar un espresso en una taza grande.',
        'Añadir agua caliente al espresso al gusto, generalmente entre 180 ml.',
        'Remover suavemente y disfrutar.',
      ],
      publicado: true,
    ),
    Receta(
      id: '4',
      nombre: 'Espumoso con Menta',
      descripcion: 'Una refrescante combinación de espresso y crema espumosa con un toque de menta, ideal para disfrutar en cualquier momento del día.',
      imagen: 'assets/images/espumoso_con_menta.png',
      calificacionPromedio: 4.7,
      tecnicaExtraccion: 'Máquina de espresso',
      tiempoPreparacion: 10,
      tipoGrano: 'Arábica',
      ingredientes: [
        '1 espresso (30 ml)',
        '240 ml de leche vaporizada',
        '2 cucharadas de jarabe de menta',
        'Hojas de menta fresca (para decorar)',
        'Espuma de leche (opcional)',
      ],
      guiaPreparacion: [
        'Preparar un espresso en una taza grande.',
        'Calentar y vaporizar la leche hasta que esté espumosa.',
        'Añadir el jarabe de menta al espresso y mezclar bien.',
        'Verter la leche vaporizada sobre el espresso y el jarabe de menta.',
        'Agregar espuma de leche en la parte superior si lo deseas.',
        'Decorar con hojas de menta fresca antes de servir.',
      ],
      publicado: true,
    ),
    Receta(
      id: '5',
      nombre: 'Mocha',
      descripcion: 'Un delicioso café que combina espresso con chocolate y leche, creando una bebida rica y cremosa.',
      imagen: 'assets/images/mocha.png',
      calificacionPromedio: 4.6,
      tecnicaExtraccion: 'Máquina de espresso',
      tiempoPreparacion: 10,
      tipoGrano: 'Arábica',
      ingredientes: [
        '1 espresso (30 ml)',
        '1 cucharada de cacao en polvo',
        '30 ml de jarabe de chocolate',
        '240 ml de leche vaporizada',
        'Espuma de leche (opcional)',
        'Chispas de chocolate (para decorar)',
      ],
      guiaPreparacion: [
        'Preparar un espresso en una taza grande.',
        'Mezclar el cacao en polvo y el jarabe de chocolate en el espresso hasta que se disuelva.',
        'Calentar y vaporizar la leche hasta que esté espumosa.',
        'Verter la leche vaporizada sobre la mezcla de espresso y chocolate.',
        'Agregar espuma de leche en la parte superior si lo deseas.',
        'Decorar con chispas de chocolate antes de servir.',
      ],
      publicado: true,
    ),
  ];

  List<Receta> filteredRecetas = []; // Lista filtrada de recetas

  @override
  void initState() {
    super.initState();
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
                        labelStyle: TextStyle(color: Colors.white), // Color de la etiqueta
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color del borde cuando no está enfocado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color del borde cuando está enfocado
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color del borde cuando está habilitado
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white), // Color del ícono
                        filled: true, // Para llenar el fondo del TextField
                        fillColor: Color(0xFFCD966C), // Color de fondo del TextField
                      ),
                      style: const TextStyle(color: Colors.white), // Color del texto dentro del TextField
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Filtros aplicados a la búsqueda')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D4925), // Color de fondo del botón
                      foregroundColor: Colors.white, // Color del texto del botón
                    ),
                    child: const Text('Filtrar'),
                  ),
                ],
              ),
            ),
            Expanded(
              // Usar ListView para permitir el desplazamiento
              child: ListView(
                children: filteredRecetas.where((receta) => receta.publicado).map((receta) {
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de detalles al tocar cualquier parte de la tarjeta
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecetaDetailPage(
                            receta: receta,
                            onFavoritoToggle: () {
                              setState(() {}); // Actualiza el estado en RecetasPage
                            },
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
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      receta.calificacionPromedio.toString(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    const Icon(Icons.star, color: Colors.amber),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    receta.favorito ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // Alternar el estado de favorito
                                      receta.favorito
                                          ? receta.quitarFavorito(context)
                                          : receta.marcarFavorito(context);
                                    });
                                  },
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
