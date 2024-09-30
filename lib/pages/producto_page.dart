import 'package:flutter/material.dart';
import '/models/producto.dart';

class ProductoPage extends StatelessWidget {
  final Producto producto;

  const ProductoPage({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8D4925), // Color de fondo del AppBar
      ),
      body: Container(
        color: const Color(0xFF8D4925), // Color de fondo del cuerpo
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(producto.imagen),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Para alinear el texto y el botón
              children: [
                const Text(
                  'Descripción',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // Encabezado en negrita
                ),
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.white), // Ícono de enlace en color blanco
                  onPressed: () {
                    producto.enlaceProducto(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              producto.descripcion,
              style: const TextStyle(fontSize: 18, color: Colors.white), // Letras blancas
            ),
            const SizedBox(height: 16),
            Text(
              'Tipo: ${producto.tipo}',
              style: const TextStyle(fontSize: 16, color: Colors.white), // Letras blancas
            ),
          ],
        ),
      ),
    );
  }
}
