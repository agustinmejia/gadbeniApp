import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Widgets
import 'package:gadbeni/widgets/background_image_top.dart';
import 'package:gadbeni/widgets/description_view.dart';

const _URL = 'https://transparencia.beni.gob.bo';

class Complaint extends StatelessWidget {
  String descriptionDummy =
      "La Secretaria de Transparencia y lucha contra la corrupción es la instancia responsable de gestionar las denuncias por actos de corrupción y llevar adelante las políticas de transparencia y lucha contra la corrupción, de acuerdo a lo establecido en la Ley 974, de 4 de septiembre 2017.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          BackgroundImageTop("assets/img/services/denuncias.jpg"),
          ListView(
            children: <Widget>[
              DescriptionView("Denuncia cuidadana", descriptionDummy),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  // style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormComplaint()));
                  },
                  child: const Text('Realizar denuncia'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FormComplaint extends StatefulWidget {
  @override
  State<FormComplaint> createState() => _FormComplaint();
}

class _FormComplaint extends State<FormComplaint> {
  String fullName = "";
  String dni = "";
  String phone = "";
  String denounced = "";
  String details = "";
  bool isFormSending = false;

  final formKey = GlobalKey<FormState>();

  void saveRegister() async {
    setState(() {
      isFormSending = true;
    });
    var baseUrl = "$_URL/api/denuncias/store";
    http.Response response = await http.post(Uri.parse(baseUrl), body: {
      'nombre_completo': fullName,
      'ci': dni,
      'telefono': phone,
      'denunciado': denounced,
      'delito': details
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['success'] == 1) {
        final snackBar = SnackBar(
          content: Text('Denuncia registrada exitosamente!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        formKey.currentState!.reset();
      }
    }
    setState(() {
      isFormSending = false;
    });
  }

  @override
  void initState() {
    super.initState();
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
                            'Ingrese los datos de su denuncia',
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
                                labelText: 'Su nombre completo *',
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
                                labelText: 'Su cédula de Identidad *',
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
                                labelText: 'Su N° de celular *',
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
                          padding: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.people_alt),
                                // hintText: 'Persona o entidad denunciada',
                                labelText: 'Persona o entidad denunciada *',
                              ),
                              onSaved: (newValue) {
                                denounced = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe ingresar a la persona o entidad denunciada";
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
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.edit_note_sharp),
                                // hintText: 'Dolor de...',
                                labelText: 'Motivo de la denuncia *',
                              ),
                              onSaved: (newValue) {
                                details = newValue!;
                              },
                              validator: (String? value) {
                                if (value == "") {
                                  return "Debe describir el motivo de la denuncia";
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
                            child: const Text('Envia denuncia ahora'),
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
