import 'dart:convert';
import 'package:bulletin/models/request/top_headlines_request.dart';
import 'package:bulletin/models/response/top_headlines_response.dart';
import 'package:http/http.dart' show Client;

class TopHeadlinesApiController {
  static const String APIKEY = '78e5c6c3ce7d46e69b3f83115c149b50';
  // '653ad353ef76457a8b158e58c64f0657';

  Future<TopHeadlinesResponse> fetchTopHeadlines(
      String country, String category) async {
    String authority = 'newsapi.org';

    String unencodedPath = '/v2/top-headlines';

    TopHeadlinesRequest topHeadlinesRequest = TopHeadlinesRequest(
        apiKey: APIKEY, country: country, category: category);

    Map<String, dynamic> queryParams = topHeadlinesRequest.toJson();
    print(queryParams);

    Uri uri = Uri.https(authority, unencodedPath, queryParams);

    final response = await Client().get(uri);
    // trycatch

    print(response.statusCode);
    print(response.request);

    if (response.statusCode == 200) {
      return TopHeadlinesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
