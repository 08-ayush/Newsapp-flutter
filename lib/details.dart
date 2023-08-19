import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:news_original/models/ListItem.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;
  const DetailsScreen({Key? key, required this.item, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: '${item.newsTitle}',
                        child: Image.network('${item.imgUrl}')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Text(
                            '${item.newsTitle}',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Icon(Icons.person),
                              Text(
                                '${item.author}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Icon(Icons.date_range),
                              Text(
                                '${item.author}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            // lipsum.createParagraph(numParagraphs: 3),
                            
                            '${item.description}'
                            '${item.content}',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ))
            ],
          )),
    );
  }
}
