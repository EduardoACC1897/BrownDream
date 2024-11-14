import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class OpinionPage extends StatefulWidget {
  const OpinionPage({super.key, required this.title});

  final String title;

  @override
  State<OpinionPage> createState() => _OpinionPageState();
}

class _OpinionPageState extends State<OpinionPage> {
  Map<String, dynamic> encuesta = {};
  Map<String, int> respuestas = {};
  final TextEditingController _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Agregado para usar con TextFormField

  // Cargar las preguntas desde el archivo JSON
  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/json/encuesta.json');
    final data = json.decode(response);
    setState(() {
      encuesta = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  // Enviar las respuestas por correo electrónico
  Future<void> sendFeedback() async {
    final Email email = Email(
      body: _generateEmailBody(),
      subject: 'Retroalimentación de la Aplicación',
      recipients: ['ecabezas22@alumnos.utalca.cl'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  // Generar el cuerpo del correo con las respuestas
  String _generateEmailBody() {
    String body = 'Nombre y Apellido del usuario: ${_idController.text}\n\n';
    encuesta.forEach((section, questions) {
      body += '$section:\n';
      for (var question in questions) {
        body += '${question["titulo"]}: ${respuestas[question["titulo"]] ?? 0} \n';
      }
      body += '\n';
    });
    return body;
  }

  // Función para mostrar el diálogo de error
  void _showNameErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Error",
            style: TextStyle(color: Colors.white), // Color blanco para el título
          ),
          backgroundColor: const Color(0xFF5C2A16),
          content: const Text(
            "Por favor ingresa tu nombre y apellido antes de enviar.",
            style: TextStyle(color: Colors.white), // Color blanco para el Contenido
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white), // Color blanco para el texto del botón
              ),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar el diálogo de confirmación
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Confirmación",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF5C2A16),
          content: const Text(
            "¿Estás seguro de que deseas enviar la retroalimentación?",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                sendFeedback(); // Enviar la retroalimentación
              },
              child: const Text(
                'Sí',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Encuesta de Retroalimentación',
          style: TextStyle(color: Colors.white), // Texto en blanco
        ),
        backgroundColor: const Color(0xFF8D4925),
      ),
      backgroundColor: const Color(0xFFCD966C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form( // Form agregado para el TextFormField
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Campo para ingresar el nombre y apellido usando TextFormField
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'Nombre y apellido: ',
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
                  filled: true,
                  fillColor: Color(0xFF8D4925),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre y apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: encuesta.isEmpty
                      ? 0
                      : encuesta['Usabilidad'].length +
                          encuesta['Contenido'].length +
                          encuesta['Compartir'].length,
                  itemBuilder: (context, index) {
                    String section;
                    int questionIndex;
                    if (index < encuesta['Usabilidad'].length) {
                      section = 'Usabilidad';
                      questionIndex = index;
                    } else if (index < encuesta['Usabilidad'].length + encuesta['Contenido'].length) {
                      section = 'Contenido';
                      questionIndex = (index - encuesta['Usabilidad'].length).toInt();
                    } else {
                      section = 'Compartir';
                      questionIndex = (index - encuesta['Usabilidad'].length - encuesta['Contenido'].length).toInt();
                    }

                    var question = encuesta[section][questionIndex];

                    return ListTile(
                      title: Text(
                        question['titulo'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question['min'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              activeTrackColor: const Color(0xFF8D4925),
                              inactiveTrackColor: const Color(0xFF8D4925).withOpacity(0.5),
                              thumbColor: const Color(0xFF8D4925),
                              overlayColor: const Color(0xFF8D4925).withOpacity(0.2),
                              valueIndicatorColor: const Color(0xFF8D4925),
                              valueIndicatorTextStyle: const TextStyle(color: Colors.white),
                            ),
                            child: Slider(
                              min: 0,
                              max: 5,
                              value: (respuestas[question['titulo']] ?? 0).toDouble(),
                              divisions: 5,
                              label: '${respuestas[question['titulo']] ?? 0} estrellas',
                              onChanged: (value) {
                                setState(() {
                                  respuestas[question['titulo']] = value.toInt();
                                });
                              },
                            ),
                          ),
                          Text(
                            question['max'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validar si se ha ingresado el nombre
                  if (_idController.text.isEmpty) {
                    _showNameErrorDialog(); // Mostrar el error si el nombre está vacío
                  } else {
                    _showConfirmationDialog(); // Mostrar la confirmación antes de enviar
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8D4925),
                ),
                child: const Text(
                  'Enviar Retroalimentación',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
