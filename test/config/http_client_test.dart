import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projetos/config/http/http_client.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late final HttpClient httpClient;
  late final Dio dio;
  late final DioAdapter dioAdapter;

  setUpAll(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    httpClient = HttpClient(dio: dio, baseUrl: 'https://example.com');
  });

  group('HttpClient test', () {
    test('HttpClient should return a successful response', () async {
      dioAdapter.onGet(
        '',
        (server) => server.reply(200, {'success': true}),
      );

      final response = await httpClient.get();

      expect(response, isNotNull);
      expect(response['success'], isTrue);
    });

    test('HttpClient should return an error response', () async {
      dioAdapter.onGet(
        '',
        (server) => server.reply(500, {'success': false}),
      );

      Map<String, dynamic> response = {};

      try {
        response = await httpClient.get();
      } catch (_) {
        expect(response, isEmpty);
      }
    });
  });
}
