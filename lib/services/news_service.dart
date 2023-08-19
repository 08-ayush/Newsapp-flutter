import 'package:dio/dio.dart';
import 'package:news_original/models/ListItem.dart';

class NewsService {
  static Dio dio = Dio();

  static Future<List<ListItem>> getNewsArticles(
      {String category = 'general'}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1454be59e08346aab3eec78a66d56a70');
    List<dynamic> list = response.data['articles'];
    List<ListItem> newsArticles = list
        .map((e) =>
            ListItem(e['urlToImage']??'',e['title'],'', e['publishedAt'],e['content']??'',e['description']??''))
        .toList();
    return newsArticles;
  }
}
