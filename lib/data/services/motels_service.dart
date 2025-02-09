import 'package:projetos/config/http/http_client.dart';
import 'package:projetos/config/log/logger.dart';
import 'package:projetos/data/model/motel_response.dart';
import 'package:projetos/data/model/result.dart';

class MotelsService {
  MotelsService({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  late final HttpClient _httpClient;

  Future<Result<MotelResponse>> getMotels() async {
    try {
      final response = await _httpClient.get();
      return Ok(
        value: MotelResponse.fromJson(response.data),
      );
    } catch (e, s) {
      Log.error(e.toString(), e, s);
      return Error(
        error:
            "Ocorreu um erro ao obter os hotéis. Por favor, tente novamente ou contate o suporte.",
      );
    }
  }
}
