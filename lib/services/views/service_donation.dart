import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';
import 'package:gadbeni/widgets/snackbar_custom.dart';

const _URL = 'https://mamore.beni.gob.bo';

class ServiceDonation extends StatelessWidget {
  String descriptionDummy =
      "Esta iniciativa está destinada a ayudar al más necesitado.\nSi tienes dificultades para conseguir algún medicamentos, ropa, insumos, etc. te nvitamos a solicitar una donación pesionando el siguiente botón y rellenando el formulario con tus datos personales y descripción de tu necesidad.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop("assets/img/services/services_list/donacion.jpg"),
          ListView(
            children: <Widget>[
              DescriptionView("Solicitar donación", descriptionDummy),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  // style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormServiceDonation()));
                  },
                  child: const Text('Solicitar donación'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FormServiceDonation extends StatefulWidget {
  @override
  State<FormServiceDonation> createState() => _FormServiceDonationState();
}

class _FormServiceDonationState extends State<FormServiceDonation> {
  String fullName = "";
  String dni = "";
  String phone = "";
  String details = "";
  var typeId;
  bool isFormSending = false;

  final formKey = GlobalKey<FormState>();

  List typesList = [];

  Future getDoctors() async {
    var baseUrl = "$_URL/api/donations_types";
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      jsonData['donations_types'].add(json.decode('{"id": 0, "name": "Otro"}'));
      setState(() => {typesList = jsonData['donations_types']});
    }
  }

  void saveRegister() async {
    setState(() {
      isFormSending = true;
    });
    var baseUrl = "$_URL/api/donations/store";
    http.Response response = await http.post(Uri.parse(baseUrl), body: {
      'full_name': fullName,
      'ci_nit': dni,
      'phone': phone,
      'donations_type_id': typeId,
      'description': details
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['success'] == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: SnackBarCustom(Icons.check_circle_outline_outlined,
                "Bien hecho!", "Donación solicitada correctamente."),
            backgroundColor: Colors.green));
        formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: SnackBarCustom(Icons.error_outline, "Error!",
                "La solicitud de donación no se registró."),
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
                            'Ingrese los datos de su solicitud',
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
                                border: const OutlineInputBorder(),
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
                                border: const OutlineInputBorder(),
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
                                border: const OutlineInputBorder(),
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
                              hint: Text('Seleccione el tipo de donación'),
                              decoration: const InputDecoration(
                                border: const OutlineInputBorder(),
                                icon: Icon(Icons.article_outlined),
                                labelText: 'Tipo de donación',
                              ),
                              items: typesList.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'].toString(),
                                  child: Text(item['name'].toString()),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  typeId = newVal.toString();
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Debe seleccionar un tipo";
                                }
                              },
                              value: typeId,
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
                                border: const OutlineInputBorder(),
                                icon: Icon(Icons.edit_note_sharp),
                                // hintText: '',
                                labelText: 'Cuéntanos acerca de tu necesidad *',
                              ),
                              onSaved: (newValue) {
                                details = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar el motivo de tu solicitud";
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
                            child: const Text('Solicitar donación ahora'),
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
