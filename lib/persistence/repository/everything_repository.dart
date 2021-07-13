import 'package:bulletin/models/response/everything_response.dart';
import 'package:bulletin/persistence/everything_api_controller.dart';

class EverythingRepository {
  EverythingApiController everythingApiController = EverythingApiController();

  Future<EverythingResponse> fetchEverthing(String q) {
    return everythingApiController.fetchEverything(q);
  }
}
