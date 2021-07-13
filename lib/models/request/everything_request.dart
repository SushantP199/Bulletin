class EverythingRequest {
  String? apiKey;
  String? q;

  EverythingRequest({this.apiKey, this.q});

  EverythingRequest.fromJson(Map<String, dynamic> json) {
    apiKey = json['apiKey'];
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.q != null) {
      data['q'] = this.q.toString(); // else show error country cannot be empty

      print("object.............${data['q']}");
    }
    if (this.apiKey != null)
      data['apiKey'] =
          this.apiKey.toString(); // else show error apikey cannot be empty
    return data;
  }
}
