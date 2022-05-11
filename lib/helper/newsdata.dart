import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/model/newsmodel.dart';
class News {
  // save json data inside list
  List<ArticleModel>datatobesavedin = [];

  Future<void> getNews() async {
    var response = await get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7ec95bfdb5804b84bb0dc782e9c58ea6'));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          //iniatialize model class
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );
          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}
//fetching news by category
  class CategoryNews{
    List<ArticleModel>datatobesavedin = [];

    Future<void> getNews(String category) async {
      var response = await get(Uri.parse(
          'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=7ec95bfdb5804b84bb0dc782e9c58ea6'));
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            //iniatialize model class
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              url: element['url'],
            );
            datatobesavedin.add(articleModel);
          }
        });
      }
  }
}