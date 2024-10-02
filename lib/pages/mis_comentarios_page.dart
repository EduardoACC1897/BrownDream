import 'package:flutter/material.dart';
import '/models/receta.dart';
import '/models/comentario.dart';
import '/models/producto.dart';
import '/models/usuario.dart';

// Página MisComentarios
class MisComentariosPage extends StatelessWidget {
  final Usuario usuario;

  const MisComentariosPage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    
    // Lista de Recetas
    List<Receta> recetas = [
      Receta(
        id: '1',
        propietario: 'SYSTEM',
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
        comentarios: [
          Comentario(
            id: '1',
            autor: 'Eduardo Cabezas',
            texto: '¡Delicioso! Perfecto para un desayuno.',
            fechaCreacion: DateTime(2023, 5, 14, 9, 30),
          ),
          Comentario(
            id: '2',
            autor: 'Luis García',
            texto: 'Me encanta el sabor de la vainilla, lo hago todos los fines de semana.',
            fechaCreacion: DateTime(2023, 5, 20, 10, 20),
          ),
          Comentario(
            id: '3',
            autor: 'María Rodríguez',
            texto: 'Un poco dulce para mi gusto, pero sigue siendo bueno.',
            fechaCreacion: DateTime(2023, 5, 22, 12, 30),
          ),
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
        publicado: true,
      ),
      Receta(
        id: '2',
        propietario: 'SYSTEM',
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
        comentarios: [
          Comentario(
            id: '1',
            autor: 'Carlos Jiménez',
            texto: 'El mejor cappuccino que he probado, muy cremoso.',
            fechaCreacion: DateTime(2023, 6, 10, 5, 40),
          ),
          Comentario(
            id: '2',
            autor: 'Eduardo Cabezas',
            texto: 'Ideal para acompañar con un croissant.',
            fechaCreacion: DateTime(2023, 6, 15, 14, 10),
          ),
          Comentario(
            id: '3',
            autor: 'Ricardo Soto',
            texto: 'Me gusta la textura, pero prefiero menos espuma.',
            fechaCreacion: DateTime(2023, 6, 18, 22, 50),
          ),
        ],
        publicado: true,
      ),
      Receta(
        id: '3',
        propietario: 'Eduardo Cabezas',
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
        comentarios: [
          Comentario(
            id: '1',
            autor: 'Sofia Hernández',
            texto: 'Un clásico, nunca falla.',
            fechaCreacion: DateTime(2023, 7, 5, 10, 30),
          ),
          Comentario(
            id: '2',
            autor: 'Juan Pérez',
            texto: 'Prefiero mi café más fuerte, pero es una buena opción.',
            fechaCreacion: DateTime(2023, 7, 12, 11, 20),
          ),
          Comentario(
            id: '3',
            autor: 'Laura Castro',
            texto: 'Sencillo y delicioso, perfecto para la tarde.',
            fechaCreacion: DateTime(2023, 7, 18, 3, 40),
          ),
        ],
        productosRecomendados: [],
        publicado: true,
      ),
      Receta(
        id: '4',
        propietario: 'Eduardo Cabezas',
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
        comentarios: [
          Comentario(
            id: '1',
            autor: 'Martín López',
            texto: 'Refrescante y perfecto para el verano.',
            fechaCreacion: DateTime(2023, 8, 2, 10, 10, 10),
          ),
          Comentario(
            id: '2',
            autor: 'Gabriela Torres',
            texto: '¡Me encanta la menta! Sabe increíble.',
            fechaCreacion: DateTime(2023, 8, 8, 4, 15),
          ),
          Comentario(
            id: '3',
            autor: 'Fernando Méndez',
            texto: 'Demasiado dulce para mí, pero bien.',
            fechaCreacion: DateTime(2023, 8, 15, 18, 30),
          ),
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
        publicado: true,
      ),
      Receta(
        id: '5',
        propietario: 'Manuel Moscoso',
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
        comentarios: [
          Comentario(
            id: '1',
            autor: 'Claudia Silva',
            texto: 'Un postre en forma de bebida, me encanta.',
            fechaCreacion: DateTime(2023, 9, 1, 19, 20),
          ),
          Comentario(
            id: '2',
            autor: 'Diego Romero',
            texto: 'Ideal para los amantes del chocolate.',
            fechaCreacion: DateTime(2023, 9, 5, 20, 30),
          ),
          Comentario(
            id: '3',
            autor: 'Eduardo Cabezas',
            texto: 'Demasiado dulce para mí, prefiero menos chocolate.',
            fechaCreacion: DateTime(2023, 9, 10, 23, 30),
          ),
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
        publicado: true,
      ),
    ];
    // Filtrar los comentarios que coinciden con el nombre del usuario
    List<Comentario> misComentarios = [];
    for (var receta in recetas) {
      for (var comentario in receta.comentarios) {
        if (comentario.autor == usuario.nombre) {
          misComentarios.add(comentario);
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Comentarios',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8D4925),
      ),
      body: Container(
        color: const Color(0xFFCD966C),
        padding: const EdgeInsets.all(16.0),
        child: misComentarios.isEmpty
            ? const Center(
                child: Text(
                  '¡No has hecho comentarios aún!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: misComentarios.length,
                itemBuilder: (context, index) {
                  final comentario = misComentarios[index];

                  // Ajuste en el formato de la fecha para mostrar solo año-mes-día hora:minuto
                  final String fechaHoraMinuto =
                      '${comentario.fechaCreacion.year}-${comentario.fechaCreacion.month.toString().padLeft(2, '0')}-${comentario.fechaCreacion.day.toString().padLeft(2, '0')} '
                      '${comentario.fechaCreacion.hour.toString().padLeft(2, '0')}:${comentario.fechaCreacion.minute.toString().padLeft(2, '0')}';

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: const Color(0xFF8D4925),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    comentario.autor,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  // Mostrar íconos de editar y borrar si es el autor
                                  if (comentario.autor == 'Eduardo Cabezas')
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit, color: Colors.white),
                                          onPressed: () {
                                            // Lógica para editar el comentario
                                            comentario.modificarComentario(context);
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.white),
                                          onPressed: () {
                                            // Lógica para borrar el comentario
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Comentario borrado'),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              Text(
                                fechaHoraMinuto, // Muestra solo la fecha y hora sin segundos
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          // Texto del comentario
                          Text(
                            comentario.texto,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}