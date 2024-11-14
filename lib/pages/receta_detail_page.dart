import 'package:flutter/material.dart';
import '/models/receta.dart';
import 'producto_page.dart';
import 'package:share_plus/share_plus.dart';


// Página RecetaDetail
class RecetaDetailPage extends StatefulWidget {
  final Receta receta;
  final Function onFavoritoToggle; // Callback para actualizar el favorito

  // Constructor que recibe la receta y el callback
  const RecetaDetailPage({
    super.key,
    required this.receta,
    required this.onFavoritoToggle, // Inicializa el callback
  });

  @override
  State<RecetaDetailPage> createState() => _RecetaDetailPageState();
}

class _RecetaDetailPageState extends State<RecetaDetailPage> {
 
 void _compartirReceta() {
  final String contenido = '''
    ${widget.receta.nombre}\n\n
    ${widget.receta.descripcion}\n\n
    Técnica de Preparación: ${widget.receta.tecnicaExtraccion}\n
    Tiempo de Preparación: ${widget.receta.tiempoPreparacion} minutos\n
    Tipo de Grano: ${widget.receta.tipoGrano}\n\n
    Ingredientes:\n
    ${widget.receta.ingredientes.join("\n")}\n\n
    Guía de Preparación:\n
    ${widget.receta.guiaPreparacion.join("\n")}
  ''';

  // Usar el paquete share_plus para compartir el contenido
  Share.share(contenido);
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.receta.nombre,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8D4925),
      ),
      body: Container(
        color: const Color(0xFF8D4925),
        padding: const EdgeInsets.all(16.0),
        // ListView para permitir el desplazamiento
        child: ListView(
          children: [
            // Imagen de la receta
            Image.asset(
              widget.receta.imagen,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [               
                // Botón de compartir
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // Llama al método de compartir
                  _compartirReceta();
                },
              ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Comprobar si el propietario no es "SYSTEM" antes de mostrar el mensaje
            if (widget.receta.propietario != "SYSTEM") ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Texto que muestra el propietario
                  Text(
                    'Creada por: ${widget.receta.propietario}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if(widget.receta.propietario == "USER") ...{
                    // Botón de editar
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Acción al presionar el icono de editar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editando receta')),
                        );
                      },
                    ),
                    // Botón  de borrar
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        // Acción al presionar el icono de borrar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Receta borrada')),
                        );
                      },
                    ),
                  }
                ],
              ),
            ],
            const SizedBox(height: 16.0),
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.descripcion,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Técnica de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tecnicaExtraccion,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tiempo de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${widget.receta.tiempoPreparacion} minutos',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tipo de Grano',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.receta.tipoGrano,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredientes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.ingredientes.map((ingrediente) => Text(
              '- $ingrediente',
              style: const TextStyle(color: Colors.white),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Guía de Preparación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            ...widget.receta.guiaPreparacion.map((paso) => Text(
              '- $paso',
              style: const TextStyle(color: Colors.white),
            )),
            const SizedBox(height: 16.0),
            // Mostrar recetas recomendadas
            const Text(
              'Producto Recomendadas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
              if (widget.receta.productosRecomendados.isNotEmpty) ...[
                ...widget.receta.productosRecomendados.map((producto) => ListTile(
                  title: Text(producto.nombre, style: const TextStyle(color: Colors.white)),
                  subtitle: Text('Tipo: ${producto.tipo}', style: const TextStyle(color: Colors.white)),
                  leading: Image.asset(producto.imagen, width: 50, height: 50, fit: BoxFit.cover),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductoPage(
                          producto: producto,
                        ),
                      ),
                    );
                  },
                )),
              ] else ...[
                const Text(
                  'No hay productos recomendados.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
              const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}