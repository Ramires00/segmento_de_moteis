class Item {
  String? nome;

  Item({this.nome});

  Item.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
  }
}
