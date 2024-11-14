import 'package:flutter/material.dart';
import '/models/receta.dart';
import '/models/producto.dart';
import 'receta_detail_page.dart';
import 'producto_page.dart';

// Página Inicio
class InicioPage extends StatefulWidget {
  const InicioPage({super.key, required this.title});

  final String title;

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  // Lista de recetas
  List<Receta> recetas = [
    Receta(
      id: '1',
      propietario: 'SYSTEM',
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
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCD966C),
        child: SingleChildScrollView(
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
                  'Recetas recomendadas',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ListView para mostrar las recetas
              Column(
                children: filteredRecetas.map((receta) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecetaDetailPage(
                            receta: receta,
                            onFavoritoToggle: () {
                              setState(() {});
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

              const SizedBox(height: 30),
              const Text(
                'Productos recomendados',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // ListView para mostrar productos recomendados
              Column(
                children: filteredRecetas.expand((receta) => receta.productosRecomendados).map((producto) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductoPage(producto: producto),
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
                                  producto.nombre,
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
                              producto.descripcion,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              producto.imagen,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}