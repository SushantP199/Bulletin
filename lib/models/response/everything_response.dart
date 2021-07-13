import 'package:bulletin/models/top_headlines_model.dart';

class EverythingResponse {
  String? status;
  int? totalResults;
  List<TopHeadlinesModel>? articles;

  EverythingResponse({this.status, this.totalResults, this.articles});

  EverythingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((value) {
        articles?.add(TopHeadlinesModel.fromJson(value));
      });
    }
  }
}
