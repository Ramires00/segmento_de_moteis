class CategoriaItem {
  String? nome;
  String? icone;

  CategoriaItem({
    this.nome,
    this.icone,
  });

  CategoriaItem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    icone = json['icone'];
  }
}
