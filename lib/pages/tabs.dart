import 'package:flutter/material.dart';
 
import 'package:news_original/services/news_service.dart';
import '../ListWidget.dart';
import '../details.dart';
import '../models/ListItem.dart';

class Articles extends StatefulWidget {
  final String? category;

  Articles({super.key, this.category});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<ListItem> listTiles = [
    // ListItem(
    //     "https://w1.pngwing.com/pngs/57/138/png-transparent-newspaper-icon-world-news-headline-google-news-plugin-newsroom-icon-design-yellow.png",
    //     lipsum.createWord(numWords: 6),
    //     lipsum.createWord(numWords: 2),
    //     "28 Jan 2020"),
    // ListItem(
    //     "https://w1.pngwing.com/pngs/57/138/png-transparent-newspaper-icon-world-news-headline-google-news-plugin-newsroom-icon-design-yellow.png",
    //     lipsum.createWord(numWords: 6),
    //     lipsum.createWord(numWords: 2),
    //     "03 Jan 2020"),
    // ListItem(
    //     "https://w1.pngwing.com/pngs/57/138/png-transparent-newspaper-icon-world-news-headline-google-news-plugin-newsroom-icon-design-yellow.png",
    //     lipsum.createWord(numWords: 6),
    //     lipsum.createWord(numWords: 2),
    //     "07 Jan 2020"),
    // ListItem(
    //     "https://w1.pngwing.com/pngs/57/138/png-transparent-newspaper-icon-world-news-headline-google-news-plugin-newsroom-icon-design-yellow.png",
    //     lipsum.createWord(numWords: 6),
    //     lipsum.createWord(numWords: 2),
    //     "02 Jan 2020"),
  ];

  @override
  void initState() {
    super.initState();
    NewsService.getNewsArticles(category: widget.category.toString()).then((value) {
      setState(() {
        listTiles = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
            itemCount: listTiles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                item: listTiles[index],
                                tag: listTiles[index].newsTitle,
                                key: null,
                              )));
                },
                child: listWidget(listTiles[index]),
              );
            },
          ),
        ),
      ),
    );
    // Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Container(),
    // ),
    // Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Container(),
    // ),
    // Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Container(),
    // ),
    // Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Container(),
    // ),
    // Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Container(),
    // ),
  }
}
