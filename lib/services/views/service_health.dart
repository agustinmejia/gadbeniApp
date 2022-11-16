import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';
import 'package:gadbeni/widgets/snackbar_custom.dart';

const _URL = 'https://fichaje.beni.gob.bo';

class ServiceHealth extends StatelessWidget {
  String descriptionDummy =
      "El Gobierno autónomo del Beni, implementando el servicio de fichaje en línea, un servicio que permitirá al paciente recabar su ficha de atención médica en línea desde su dispositivo móvil en la comodidad de su hogar.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop("assets/img/services/services_list/salud.jpg"),
          ListView(
            children: <Widget>[
              DescriptionView("Atención médica en línea", descriptionDummy),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  // style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormServiceHealth()));
                  },
                  child: const Text('Solicitar atención médica'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FormServiceHealth extends StatefulWidget {
  @override
  State<FormServiceHealth> createState() => _FormServiceHealthState();
}

class _FormServiceHealthState extends State<FormServiceHealth> {
  String fullName = "";
  String dni = "";
  String phone = "";
  String details = "";
  var doctorId;
  bool isFormSending = false;

  final formKey = GlobalKey<FormState>();

  List doctorsList = [];

  Future getDoctors() async {
    var baseUrl = "$_URL/api/medicos";
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() => {doctorsList = jsonData['medicos']});
    }
  }

  void saveRegister() async {
    setState(() {
      isFormSending = true;
    });
    var baseUrl = "$_URL/api/citas/store";
    http.Response response = await http.post(Uri.parse(baseUrl), body: {
      'nombre_completo': fullName,
      'ci': dni,
      'celular': phone,
      'doctor_id': doctorId,
      'descripcion': details
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['success'] == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: SnackBarCustom(Icons.check_circle_outline_outlined,
                "Bien hecho!", "Cita médica solicitada correctamente."),
            backgroundColor: Colors.green));
        formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: SnackBarCustom(Icons.error_outline, "Error!",
                "La cita médica no se registró."),
            backgroundColor: Colors.red));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: SnackBarCustom(
              Icons.error_outline, "Error!", "Error en el servidor."),
          backgroundColor: Colors.red));
    }
    setState(() {
      isFormSending = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 50),
            child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'Ingrese los datos para su atención',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Juan Perez Perez',
                                labelText: 'Nombre completo *',
                              ),
                              onSaved: (newValue) {
                                fullName = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar su nombre completo";
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.web),
                                hintText: '12345678',
                                labelText: 'Cédula de Identidad *',
                              ),
                              onSaved: (newValue) {
                                dni = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar su CI";
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.phone_android_outlined),
                                hintText: '75199157',
                                labelText: 'N° de celular *',
                              ),
                              onSaved: (newValue) {
                                phone = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar su número de celular";
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: DropdownButtonFormField(
                              hint: Text('Seleccione al médico'),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.medical_services_outlined),
                                labelText: 'Médico',
                              ),
                              items: doctorsList.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'].toString(),
                                  child:
                                      Text(item['nombre_completo'].toString()),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  doctorId = newVal.toString();
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Debe seleccionar un médico";
                                }
                              },
                              value: doctorId,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.edit_note_sharp),
                                hintText: 'Dolor de...',
                                labelText: 'Motivo de la consulta *',
                              ),
                              onSaved: (newValue) {
                                details = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar el motivo de la consulta";
                                }
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: isFormSending
                              ? const CircularProgressIndicator()
                              : null,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: ElevatedButton(
                            // style: style,
                            onPressed: isFormSending
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      saveRegister();
                                    }
                                  },
                            child: const Text('Solicitar cita médica ahora'),
                          ),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
