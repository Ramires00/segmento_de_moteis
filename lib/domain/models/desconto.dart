class Desconto {
  num? desconto;

  Desconto({this.desconto});

  Desconto.fromJson(Map<String, dynamic> json) {
    desconto = json['desconto'];
  }
}
