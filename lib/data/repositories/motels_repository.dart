import 'package:projetos/data/model/motel_response.dart';
import 'package:projetos/data/model/result.dart';
import 'package:projetos/data/services/motels_service.dart';
import 'package:projetos/domain/models/motel.dart';

class MotelsRepository {
  MotelsRepository({
    required MotelsService motelsService,
  }) : _motelsService = motelsService;

  final MotelsService _motelsService;

  Future<Result<List<Motel>>> getMotels() async {
    final motelsResult = await _motelsService.getMotels();

    switch (motelsResult) {
      case Ok<MotelResponse>():
        return Ok(value: motelsResult.value.data?.moteis ?? []);
      case Error<MotelResponse>():
      default:
        return Error(
          error: (motelsResult as Error).error,
        );
    }
  }
}
