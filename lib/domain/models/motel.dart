import 'package:projetos/domain/models/suite.dart';

class Motel {
  String? fantasia;
  String? logo;
  String? bairro;
  num? distancia;
  num? qtdFavoritos;
  List<Suite>? suites;
  num? qtdAvaliacoes;
  num? media;

  Motel({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  Motel.fromJson(Map<String, dynamic> json) {
    fantasia = json['fantasia'];
    logo = json['logo'];
    bairro = json['bairro'];
    distancia = json['distancia'];
    qtdFavoritos = json['qtdFavoritos'];
    if (json['suites'] != null) {
      suites = [];
      json['suites'].forEach((v) {
        suites?.add(Suite.fromJson(v));
      });
    }
    qtdAvaliacoes = json['qtdAvaliacoes'];
    media = json['media'];
  }
}
