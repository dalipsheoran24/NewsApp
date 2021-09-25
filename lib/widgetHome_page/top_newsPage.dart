import 'dart:async';
import 'dart:convert';

import 'file:///C:/Users/hp/AndroidStudioProjects/dainik_bhaskar/lib/model/routs_widget.dart';
import 'package:dainik_bhaskar/model/news_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TopNewsPage extends StatefulWidget {
  @override
  _TopNewsPageState createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  ScrollController _myController = ScrollController();
  List<Articles> topNewsList = [];

  Future getData() async {

    Uri myUri = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=62635c7880c54e13a76303a91ccce4ee");
    Response response = await get(myUri);
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body) as Map;

      NewsInfo newsInfo = NewsInfo.fromJson(map);
      topNewsList = newsInfo.articles;
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: _myController,
                  itemCount: topNewsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            title: Text(
                              topNewsList[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                                  topNewsList[index].description,maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),

                            trailing: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(topNewsList[index].urlToImage),

                                )
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Routes.SECOND,
                                  arguments: topNewsList[index]);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.favorite_border_outlined),
                                    Expanded(
                                        child:
                                            Icon(Icons.mode_comment_outlined)),
                                    Icon(Icons.share)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
