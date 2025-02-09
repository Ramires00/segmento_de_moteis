import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projetos/data/model/result.dart';
import 'package:projetos/data/repositories/motels_repository.dart';
import 'package:projetos/domain/models/motel.dart';

class MotelsViewModel extends ChangeNotifier {
  MotelsViewModel({required MotelsRepository repository})
      : _repository = repository;
  final MotelsRepository _repository;

  List<Motel> _motels = [];
  UnmodifiableListView<Motel> get motels => UnmodifiableListView(_motels);

  Error<List<Motel>>? _error;
  Error<List<Motel>>? get error => _error;

  bool isLoading = false;

  Future<void> getMotels() async {
    isLoading = true;
    notifyListeners();

    final motelsResult = await _repository.getMotels();

    switch (motelsResult) {
      case Ok<List<Motel>>():
        _motels = motelsResult.value;
        break;
      case Error<List<Motel>>():
        _error = motelsResult;
    }

    isLoading = false;
    notifyListeners();
  }
}
