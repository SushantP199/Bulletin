import 'package:bulletin/models/response/top_headlines_response.dart';
import 'package:bulletin/persistence/top_headlines_api_controller.dart';
import 'package:flutter/foundation.dart';

class TopHeadlinesRepository {
  TopHeadlinesApiController topHeadlinesApiController =
      TopHeadlinesApiController();

  Future<TopHeadlinesResponse> fetchTopHeadlines(
          String country, String category) =>
      topHeadlinesApiController.fetchTopHeadlines(country, category);
}
