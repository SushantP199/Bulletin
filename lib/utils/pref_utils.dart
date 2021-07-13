import 'dart:convert';
import 'shared_preference.dart';

class PrefUtils {
  // country
  static void setCountry(String country) {
    Prefs.prefs?.setString('country', country);
  }

  static String getCountry() {
    String? value = Prefs.prefs?.getString('country');
    return value.toString();
  }

  // category
  static void setCategory(String category) {
    Prefs.prefs?.setString('category', category);
  }

  static String getCategory() {
    String? value = Prefs.prefs?.getString('category');
    return value.toString();
  }

  // top 20 headlines
  static void setTopHeadlines(List<TopHeadlines> articles) async {
    String encodedData = TopHeadlines.encode(articles);
    await Prefs.prefs?.setString('articles', encodedData);
  }

  static Future<List<TopHeadlines>> getTopHeadlines() async {
    // ignore: await_only_futures
    String? topHeadlinesString = await Prefs.prefs?.getString('articles');
    List<TopHeadlines> topHeadlines =
        TopHeadlines.decode(topHeadlinesString.toString());
    return topHeadlines;
  }
}

class TopHeadlines {
  late final String? author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content;

  TopHeadlines({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  TopHeadlines.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  static Map<String, dynamic> toMap(TopHeadlines topHeadlines) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['author'] = topHeadlines.author;
    data['title'] = topHeadlines.title;
    data['description'] = topHeadlines.description;
    data['url'] = topHeadlines.url;
    data['urlToImage'] = topHeadlines.urlToImage;
    data['publishedAt'] = topHeadlines.publishedAt;
    data['content'] = topHeadlines.content;
    return data;
  }

  static String encode(List<TopHeadlines> topHeadlines) {
    return json.encode(topHeadlines.map((e) => TopHeadlines.toMap(e)).toList());
  }

  static List<TopHeadlines> decode(String topHeadlines) {
    return (json.decode(topHeadlines) as List<dynamic>)
        .map((e) => TopHeadlines.fromJson(e))
        .toList();
  }
}
