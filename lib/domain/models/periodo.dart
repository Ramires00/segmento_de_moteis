import 'package:projetos/domain/models/desconto.dart';

class Periodo {
  String? tempoFormatado;
  String? tempo;
  num? valor;
  num? valorTotal;
  bool? temCortesia;
  Desconto? desconto;

  Periodo({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  Periodo.fromJson(Map<String, dynamic> json) {
    tempoFormatado = json['tempoFormatado'];
    tempo = json['tempo'];
    valor = json['valor'];
    valorTotal = json['valorTotal'];
    temCortesia = json['temCortesia'];
    desconto =
        json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null;
  }
}
