import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cep_model.dart';

class EdicaoCepPage extends StatefulWidget {
  CepModel cepModel;

  EdicaoCepPage(this.cepModel);

  @override
  _EdicaoCepPageState createState() => _EdicaoCepPageState();
}

class _EdicaoCepPageState extends State<EdicaoCepPage> {
  var cepController = TextEditingController(text: '');
  var cidadeController = TextEditingController(text: '');
  var ufController = TextEditingController(text: '');
  var ddController = TextEditingController(text: '');
  var ruaController = TextEditingController(text: '');
  var ibgbeController = TextEditingController(text: '');
  var giaController = TextEditingController(text: '');
  var bairroCotroller = TextEditingController(text: '');
  var siafiController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    atribuiValores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Edição de CEP'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: cepController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('CEP'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: cidadeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Cidade'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: ruaController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Rua'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: bairroCotroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Bairro'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: ibgbeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Código Ibge'),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: ufController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('UF'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: ddController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('DDD'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: giaController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('GIA'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: siafiController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('SIAFI'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                salvar();
                              },
                              child: const Text('Salvar'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void salvar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      //authController.cadastrarUsuario();
    }
  }

  void atribuiValores() {
    cepController.text = widget.cepModel.cep;
    ddController.text = widget.cepModel.ddd;
    giaController.text = widget.cepModel.gia;
    siafiController.text = widget.cepModel.siafi;
    bairroCotroller.text = widget.cepModel.bairro;
    ruaController.text = widget.cepModel.logradouro;
    ufController.text = widget.cepModel.uf;
    cidadeController.text = widget.cepModel.localidade;
  }
}
