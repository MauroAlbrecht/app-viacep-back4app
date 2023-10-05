import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/material.dart';

import '../models/via_cep_model.dart';
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
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();

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
                    });
                    var cep = val.replaceAll(RegExp(r'[^0-9]'), '');
                    viaCepModel = ViaCepModel();
                    if (cep.trim().length == 8) {
                      viaCepModel = await viaCepRepository.consultarCEP(cep);
                    }

                    setState(() {
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
              Visibility(visible: loading, child: const CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
