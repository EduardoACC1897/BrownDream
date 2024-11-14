import 'package:flutter/material.dart';
import '/models/receta.dart';
import '/models/producto.dart';
import 'receta_detail_page.dart';

// Página Perfil
class MisRecetasPage extends StatefulWidget {
  const MisRecetasPage({super.key, required this.title});

  final String title;

  @override
  State<MisRecetasPage> createState() => _MisRecetasPageState();
}

class _MisRecetasPageState extends State<MisRecetasPage> {
  // Controlador para la búsqueda
  final TextEditingController _searchController = TextEditingController();
  // Lista de recetas
  List<Receta> recetas = [
    Receta(
      id: '1',
      propietario: 'USER',
      imagen: 'assets/images/vanilla_latte.png',
      nombre: 'Vanilla Latte',     
      descripcion: 'Un delicioso y cremoso café que combina espresso con leche vaporizada y jarabe de vainilla, ideal para los amantes de los sabores dulces.',
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
      productosRecomendados: [
        Producto(
          id: '1',
          imagen: 'assets/images/jarabe_de_vainilla.png',
          nombre: 'Jarabe de Vainilla',
          tipo: 'Saborizante',
          descripcion: 'Un jarabe dulce y aromático que añade un toque de vainilla a tus bebidas. Ideal para el Vanilla Latte, este jarabe resalta la suavidad de la leche vaporizada y complementa el amargor del espresso, creando una experiencia deliciosa.'
        ),
      ],
    ),
    Receta(
      id: '2',
      propietario: 'SYSTEM',
      imagen: 'assets/images/cappuccino.png',
      nombre: 'Cappuccino',
      descripcion: 'Un clásico café italiano que mezcla espresso con partes iguales de leche vaporizada y espuma de leche, creando una textura cremosa y rica.',
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
    ),
    Receta(
      id: '3',
      propietario: 'SYSTEM',
      imagen: 'assets/images/americano.png',
      nombre: 'Americano',
      descripcion: 'Un café simple y fuerte que se prepara añadiendo agua caliente a un espresso, manteniendo su robustez y sabor característico.',
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
      productosRecomendados: [],
    ),
    Receta(
      id: '4',
      propietario: 'SYSTEM',
      imagen: 'assets/images/espumoso_con_menta.png',
      nombre: 'Espumoso con Menta',
      descripcion: 'Una refrescante combinación de espresso y crema espumosa con un toque de menta, ideal para disfrutar en cualquier momento del día.',    
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
      productosRecomendados: [
        Producto(
          id: '1',
          imagen: 'assets/images/hojas_de_menta_fresca.png',
          nombre: 'Hojas de Menta Fresca',
          tipo: 'Hierba aromática',
          descripcion: 'Utilizadas como decoración y para añadir frescura a bebidas como el "Espumoso con Menta", las hojas de menta fresca ofrecen un toque aromático y visual, proporcionando un contraste refrescante con la calidez del espresso y la crema espumosa.'
        ),
      ],
    ),
    Receta(
      id: '5',
      propietario: 'SYSTEM',
      imagen: 'assets/images/mocha.png',
      nombre: 'Mocha',
      descripcion: 'Un delicioso café que combina espresso con chocolate y leche, creando una bebida rica y cremosa.',    
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
      productosRecomendados: [
        Producto(
          id: '1',
          imagen: 'assets/images/cacao_en_polvo.png',
          nombre: 'Cacao en Polvo',
          tipo: 'Polvo de chocolate',
          descripcion: 'Perfecto para recetas que incluyen chocolate, como el Mocha. El cacao en polvo sin azúcar le da un sabor profundo y auténtico a chocolate a tus bebidas, equilibrando la dulzura del jarabe de chocolate con un toque más fuerte y natural.'
        ),
      ],
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
    // Filtrar las recetas que están marcadas como favoritas
    final recetasCreadas = filteredRecetas.where((receta) => receta.propietario == "USER");
    
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C),
        child: Column(
          children: [
            // Mostrar la barra de búsqueda solo si hay recetas creadas
            if (recetasCreadas.isNotEmpty)
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
                          filled: true,
                          fillColor: Color(0xFFCD966C),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

            // Mostrar recetas favoritas o mensaje si la lista está vacía
            Expanded(
              child: recetasCreadas.isEmpty
                  ? const Center(
                      child: Text(
                        '¡No has creado ninguna receta!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : ListView(
                      children: recetasCreadas.map((receta) {
                        return GestureDetector(
                          onTap: () {
                            // Navegar a la pantalla de detalles al tocar cualquier parte de la tarjeta
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecetaDetailPage(
                                  receta: receta,
                                  onFavoritoToggle: () {
                                    setState(() {}); // Actualiza el estado en FavoritosPage
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para crear una receta
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Receta creada')),
          );
        },
        backgroundColor: const Color(0xFF8D4925),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
