import 'package:projetos/data/model/motel_response_data.dart';

class MotelResponse {
  bool? sucesso;
  MotelResponseData? data;

  MotelResponse({this.sucesso = false, this.data});

  MotelResponse.fromJson(Map<String, dynamic> json) {
    sucesso = json['sucesso'];
    data =
        json['data'] != null ? MotelResponseData.fromJson(json['data']) : null;
  }
}
