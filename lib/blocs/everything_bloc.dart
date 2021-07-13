import 'package:bulletin/models/response/everything_response.dart';
import 'package:bulletin/persistence/repository/everything_repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class EverythingBloc {
  EverythingRepository _everythingRepository = EverythingRepository();

  final _fetchEverything = PublishSubject<EverythingResponse>();

  Stream<EverythingResponse> get getEverything => _fetchEverything.stream;

  fetchEverything(String q) async {
    EverythingResponse everythingResponse =
        await _everythingRepository.fetchEverthing(q);
    _fetchEverything.sink.add(everythingResponse);
  }

  dispose() {
    _fetchEverything.close();
  }
}
