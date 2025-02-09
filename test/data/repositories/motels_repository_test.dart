import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projetos/data/model/motel_response.dart';
import 'package:projetos/data/model/motel_response_data.dart';
import 'package:projetos/data/model/result.dart';
import 'package:projetos/data/repositories/motels_repository.dart';
import 'package:projetos/domain/models/categoria_item.dart';
import 'package:projetos/domain/models/desconto.dart';
import 'package:projetos/domain/models/item.dart';
import 'package:projetos/domain/models/motel.dart';
import 'package:projetos/domain/models/periodo.dart';
import 'package:projetos/domain/models/suite.dart';

import '../../../testing/fakes/motels_service_mock.dart';

void main() {
  late final MockMotelsService mockService;
  late final MotelResponse fakeResponse;
  late final MotelsRepository repo;

  setUpAll(() {
    mockService = MockMotelsService();
    repo = MotelsRepository(motelsService: mockService);
    fakeResponse = MotelResponse(
      data: MotelResponseData(
        moteis: [
          Motel(
            bairro: 'bairro',
            distancia: 100,
            fantasia: 'fantasia',
            logo: 'logo',
            media: 100,
            qtdAvaliacoes: 100,
            qtdFavoritos: 100,
            suites: [
              Suite(
                categoriaItens: [
                  CategoriaItem(icone: 'icone', nome: 'nome'),
                ],
                exibirQtdDisponiveis: true,
                fotos: ['foto'],
                itens: [Item(nome: 'nome')],
                nome: 'nome',
                periodos: [
                  Periodo(
                    desconto: Desconto(desconto: 0),
                    temCortesia: false,
                    tempo: 'tempo',
                    tempoFormatado: 'tempoFormatado',
                    valor: 100,
                    valorTotal: 100,
                  )
                ],
              )
            ],
          )
        ],
        maxPaginas: 1,
        pagina: 1,
        qtdPorPagina: 11,
        raio: 100,
        totalMoteis: 1,
        totalSuites: 1,
      ),
      sucesso: true,
    );
  });

  group('MotelsRepository test', () {
    test('MotelsRepository should return an Ok<List<Motel>>', () async {
      when(mockService.getMotels).thenAnswer(
        (_) async => Ok(value: fakeResponse),
      );

      final Result<List<Motel>> response =
          await repo.getMotels() as Ok<List<Motel>>;

      final okResult = response as Ok<List<Motel>>;

      expect(okResult, isA<Ok<List<Motel>>>());
      expect(okResult.value.isNotEmpty, isTrue);
    });

    test('MotelsRepository should return an Error', () async {
      when(mockService.getMotels).thenAnswer(
        (_) async => Error(error: "An error has ocurred trying to get motels"),
      );

      final Result<List<Motel>> response = await repo.getMotels();

      expect(response, isA<Error>());

      final errorResult = response as Error;

      expect(errorResult, isA<Error>());
      expect(errorResult.error, "An error has ocurred trying to get motels");
    });
  });
}
