import 'package:app_viacep_back4app/models/cep_model.dart';

import 'dio/back4app_custom_dio.dart';

class CepBack4appRepository {
  final _dioCustom = Back4appCustomDio();

  Future<CepsModel> findAll() async {
    var url = '/Ceps';
    var result = await _dioCustom.dio.get(url);
    return CepsModel.fromJson(result.data);
  }

  Future<CepsModel> findByCep(var cep) async {
    var url = '/Ceps';
    url = '$url?where={\"cep":$cep}';
    var result = await _dioCustom.dio.get(url);
    return CepsModel.fromJson(result.data);
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
}
