import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projetos/data/model/motel_response.dart';
import 'package:projetos/data/model/result.dart';
import 'package:projetos/data/services/motels_service.dart';

import '../../../testing/fakes/fake_json.dart';
import '../../../testing/fakes/http_client_mock.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late MotelsService motelsService;

  setUp(() {
    mockHttpClient = MockHttpClient();
    motelsService = MotelsService(httpClient: mockHttpClient);
  });

  group('MotelsService test', () {
    test('MotelsService should return an Ok MotelResponse', () async {
      final fakeResponse = Response(
        requestOptions: RequestOptions(path: 'path'),
        statusCode: 200,
        data: fakeJson,
      );

      when(
        () => mockHttpClient.get(
          path: any(
            named: 'path',
          ),
        ),
      ).thenAnswer(
        (_) async => fakeResponse,
      );

      final Result<MotelResponse> response = await motelsService.getMotels();

      final okResult = response as Ok<MotelResponse>;

      expect(response, isA<Ok>());
      expect(okResult.value, isA<MotelResponse>());
      expect(okResult.value.data, isNotNull);
      expect(okResult.value.data?.moteis, isNotEmpty);
      expect(okResult.value.data?.moteis?[0].suites, isNotEmpty);
    });

    test('MotelsService should return an Error', () async {
      final Map<String, dynamic>? fakeJson = null;

      final fakeResponse = Response(
        requestOptions: RequestOptions(path: 'path'),
        statusCode: 500,
        data: fakeJson,
      );

      when(
        () => mockHttpClient.get(
          path: any(
            named: 'path',
          ),
        ),
      ).thenAnswer(
        (_) async => fakeResponse,
      );

      final Result<MotelResponse> response = await motelsService.getMotels();

      expect(response, isA<Error>());

      final errorResult = response as Error;

      expect(errorResult, isA<Error>());
      expect(
        errorResult.error,
        "Ocorreu um erro ao obter os hotéis. Por favor, tente novamente ou contate o suporte.",
      );
    });
  });
}
