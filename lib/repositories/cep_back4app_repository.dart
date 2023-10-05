import 'package:app_viacep_back4app/models/ceps_back4app_model.dart';

import '../models/via_cep_model.dart';
import 'dio/back4app_custom_dio.dart';

class CepBack4appRepository {
  final _dioCustom = Back4appCustomDio();

  Future<CepsBack4appModel> findAll() async {
    var url = '/Ceps';
    var result = await _dioCustom.dio.get(url);
    return CepsBack4appModel.fromJson(result.data);
  }

  Future<CepsBack4appModel> findByCep(var cep) async {
    var url = '/Ceps';
    url = '$url?where={\"cep":$cep}';
    var result = await _dioCustom.dio.get(url);
    return CepsBack4appModel.fromJson(result.data);
  }

  Future<void> criar(CepModel tarefaModel) async {
    var url = '/Ceps';
    await _dioCustom.dio.post(url, data: tarefaModel.toCreateJson());
  }

  Future<void> atualizar(CepModel tarefaModel) async {
    var url = '/Ceps/${tarefaModel.objectId}';
    await _dioCustom.dio.put(url, data: tarefaModel.toCreateJson());
  }

  Future<void> remover(CepModel tarefaModel) async {
    var url = '/Ceps/${tarefaModel.objectId}';
    await _dioCustom.dio.delete(url);
  }

  Future<void> criarCep(ViaCepModel cepModel) async {
    var cep = CepModel();
  }
}
