import 'package:bulletin/models/request/everything_request.dart';
import 'package:bulletin/models/response/everything_response.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class EverythingApiController {
  static const String APIKEY = '78e5c6c3ce7d46e69b3f83115c149b50';
  //'653ad353ef76457a8b158e58c64f0657';

  Future<EverythingResponse> fetchEverything(String q) async {
    String authority = 'newsapi.org';

    String unencodedPath = '/v2/everything';

    EverythingRequest everythingRequest =
        EverythingRequest(apiKey: APIKEY, q: q);

    Map<String, dynamic> queryParams = everythingRequest.toJson();
    print(queryParams);

    Uri uri = Uri.https(authority, unencodedPath, queryParams);

    final response = await Client().get(uri);
    print(response.request);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return EverythingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
