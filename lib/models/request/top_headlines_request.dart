class TopHeadlinesRequest {
  String? apiKey;
  String? country;
  String? category;

  TopHeadlinesRequest({this.apiKey, this.country, this.category});

  TopHeadlinesRequest.fromJson(Map<String, dynamic> json) {
    apiKey = json['apiKey'];
    country = json['country'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.country != null)
      data['country'] =
          this.country.toString(); // else show error country cannot be empty
    if (this.category != null && this.category != '')
      data['category'] = this.category.toString();
    if (this.apiKey != null)
      data['apiKey'] =
          this.apiKey.toString(); // else show error apikey cannot be empty

    return data;
  }
}
