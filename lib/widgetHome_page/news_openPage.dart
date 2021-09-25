import 'package:dainik_bhaskar/model/news_info.dart';
import 'package:flutter/material.dart';
class NewsOpenPage extends StatefulWidget {
  @override
  _NewsOpenPageState createState() => _NewsOpenPageState();
}

class _NewsOpenPageState extends State<NewsOpenPage> {
ScrollController myController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Articles data = ModalRoute
        .of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Center(

          child: ListView(
            children: [

              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.urlToImage)
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10,left: 8,right: 8),
                child: Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10,left: 8,right: 8),
                child: Text(
                  data.description,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
