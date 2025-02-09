import 'package:projetos/domain/models/motel.dart';

class MotelResponseData {
  num? pagina;
  num? qtdPorPagina;
  num? totalSuites;
  num? totalMoteis;
  num? raio;
  num? maxPaginas;
  List<Motel>? moteis;

  MotelResponseData({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  MotelResponseData.fromJson(Map<String, dynamic> json) {
    pagina = json['pagina'];
    qtdPorPagina = json['qtdPorPagina'];
    totalSuites = json['totalSuites'];
    totalMoteis = json['totalMoteis'];
    raio = json['raio'];
    maxPaginas = json['maxPaginas'];
    if (json['moteis'] != null) {
      moteis = [];
      json['moteis'].forEach((v) {
        moteis?.add(Motel.fromJson(v));
      });
    }
  }
}
