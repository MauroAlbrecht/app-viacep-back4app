class CepsBack4appModel {
  List<CepModel>? ceps;

  CepsBack4appModel({this.ceps});

  CepsBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CepModel>[];
      json['results'].forEach((v) {
        ceps!.add(new CepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ceps != null) {
      data['results'] = this.ceps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CepModel {
  String? objectId;
  int? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  int? ibge;
  String? gia;
  int? ddd;
  int? siafi;
  String? createdAt;
  String? updatedAt;

  CepModel({this.objectId, this.cep, this.logradouro, this.complemento, this.bairro, this.localidade, this.uf, this.ibge, this.gia, this.ddd, this.siafi, this.createdAt, this.updatedAt});

  CepModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
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
