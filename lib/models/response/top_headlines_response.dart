import 'package:bulletin/models/top_headlines_model.dart';
import 'package:bulletin/utils/pref_utils.dart';

class TopHeadlinesResponse {
  String? status;
  int? totalResults;
  List<TopHeadlinesModel>? articles;

  List<TopHeadlines>? topHeadlines;

  TopHeadlinesResponse({this.status, this.totalResults, this.articles});

  TopHeadlinesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((value) {
        articles?.add(TopHeadlinesModel.fromJson(value));
      });

      // topHeadlines = [];
      // json['articles'].forEach((value) {
      //   topHeadlines?.add(TopHeadlines.fromJson(value));
      // });
    }
  }
}
