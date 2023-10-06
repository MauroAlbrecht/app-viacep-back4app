import 'package:app_viacep_back4app/repositories/cep_back4app_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/material.dart';

import '../models/cep_model.dart';
import '../repositories/via_cep_repository.dart';

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  var cepController = TextEditingController(text: '');
  var maskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );
  bool loading = false;

  //bool verificandoNaBack4app = false;
  var viaCepModel = CepModel();
  var viaCepRepository = ViaCepRepository();
  var cepRepository = CepBack4appRepository();
  var msgExecutando = '';
  var cepNaoEncontrado = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Busca de CEPs',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe o CEP aqui',
                  ),
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.number,
                  controller: cepController,
                  onChanged: (String val) async {
                    setState(() {
                      loading = true;
                      msgExecutando = 'Verificando CEP na ViaCep...';
                    });
                    var cep = val.replaceAll(RegExp(r'[^0-9]'), '');
                    viaCepModel = CepModel();

                    if (cep.trim().length == 8) {
                      setState(() {
                        cepNaoEncontrado = false;
                      });
                      viaCepModel = await viaCepRepository.consultarCEP(cep);
                      if (viaCepModel.cep != null) {
                        setState(() {
                          // verificandoNaBack4app = true;
                          msgExecutando = 'Verificando CEP na Back4app...';
                        });

                        var cepBack4app = await cepRepository.findByCep(cep);

                        if (cepBack4app.ceps!.isEmpty) {
                          setState(() {
                            // verificandoNaBack4app = true;
                            msgExecutando = 'Criando CEP no Back4app...';
                          });
                            await cepRepository.criar(viaCepModel);
                        }
                      } else {
                        setState(() {
                          cepNaoEncontrado = true;
                        });
                      }
                    }

                    setState(() {
                      //verificandoNaBack4app = false;
                      loading = false;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                viaCepModel.logradouro ?? '',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                '${viaCepModel.localidade ?? ''} ${viaCepModel.localidade != null ? '-' : ''} ${viaCepModel.uf ?? ''}',
                style: const TextStyle(fontSize: 22),
              ),
              //Visibility(visible: loading, child: const CircularProgressIndicator()),
              const SizedBox(
                height: 20,
              ),
              Visibility(visible: loading, child: const CircularProgressIndicator()),
              Visibility(
                visible: cepNaoEncontrado,
                child: Column(
                  children: const [
                    Icon(
                      Icons.search_off_sharp,
                      size: 45,
                      color: Colors.deepOrange,
                    ),
                    Text(
                      'CEP não encontrado, verifique!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: loading,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      msgExecutando,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
