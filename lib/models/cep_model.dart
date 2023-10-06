class CepModel {
  String? objectId;
  int? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  int? ibge;
  int? gia;
  int? ddd;
  int? siafi;
  String? createdAt;
  String? updatedAt;

  CepModel({this.objectId, this.cep, this.logradouro, this.complemento, this.bairro, this.localidade, this.uf, this.ibge, this.gia, this.ddd, this.siafi, this.createdAt, this.updatedAt});

  CepModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = int.tryParse(json['cep'].toString().replaceAll('-', ''));
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = int.tryParse(json['ibge'].toString());
    gia = int.tryParse(json['gia'].toString());
    ddd = int.tryParse(json['ddd'].toString());
    siafi = int.tryParse(json['siafi'].toString());
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = this.objectId;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    return data;
  }
}
