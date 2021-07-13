/// [TODO]: Imports
/// [TODO]: List of News
/// [TODO]: Stream Controllers
/// [TODO]: Stream Sink getter
/// [TODO]: Contructor add/listen changes
/// [TODO]: Core functions
/// [TODO]: Dispose

import 'dart:async';
import 'package:bulletin/models/response/top_headlines_response.dart';
import 'package:bulletin/persistence/repository/top_headlines_repository.dart';
import 'package:rxdart/rxdart.dart';

class TopHeadlinesBloc {
  TopHeadlinesRepository _topHeadlinesRepository = TopHeadlinesRepository();

  final _fetchTopHeadlines = PublishSubject<TopHeadlinesResponse>();

  Stream<TopHeadlinesResponse> get topHeadlines => _fetchTopHeadlines.stream;

  fetchTopHeadlines(String country, String category) async {
    TopHeadlinesResponse topHeadlinesResponse =
        await _topHeadlinesRepository.fetchTopHeadlines(country, category);
    _fetchTopHeadlines.sink.add(topHeadlinesResponse);
  }

  dispose() {
    _fetchTopHeadlines.close();
  }
}

// final TopHeadlinesBloc topHeadlinesBloc = TopHeadlinesBloc();
