import 'package:projetos/domain/models/categoria_item.dart';
import 'package:projetos/domain/models/item.dart';
import 'package:projetos/domain/models/periodo.dart';

class Suite {
  String? nome;
  num? qtd;
  bool? exibirQtdDisponiveis;
  List<String>? fotos;
  List<Item>? itens;
  List<CategoriaItem>? categoriaItens;
  List<Periodo>? periodos;

  Suite({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  Suite.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    qtd = json['qtd'];
    exibirQtdDisponiveis = json['exibirQtdDisponiveis'];
    fotos = json['fotos'].cast<String>();
    if (json['itens'] != null) {
      itens = [];
      json['itens'].forEach((v) {
        itens?.add(Item.fromJson(v));
      });
    }
    if (json['categoriaItens'] != null) {
      categoriaItens = [];
      json['categoriaItens'].forEach((v) {
        categoriaItens?.add(CategoriaItem.fromJson(v));
      });
    }
    if (json['periodos'] != null) {
      periodos = [];
      json['periodos'].forEach((v) {
        periodos?.add(Periodo.fromJson(v));
      });
    }
  }
}
