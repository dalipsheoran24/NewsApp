
import 'package:dainik_bhaskar/action_icon/alert_page.dart';
import 'package:dainik_bhaskar/widgetHome_page/top_newsPage.dart';
import 'package:dainik_bhaskar/widget_statePage/state_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  final List<Tab> topTabs =<Tab>[
    Tab(text: 'Top News'),
    Tab(text: 'State'),
    // Tab(text: 'Sports'),
    // Tab(text: 'Life & Science'),
  ];
  @override
  void initState () {
    _tabController = TabController(length: 2,initialIndex: 0, vsync: this)
      ..addListener((){
        setState(() {

        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Dainik Bhaskar',

        style: TextStyle(
          fontWeight: FontWeight.w900,
       color: Colors.black,
            fontSize: 20
        ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add_alert , color: Colors.black,), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AlertPage()));

          }),
          IconButton(icon: Icon(Icons.file_copy, color: Colors.black,), onPressed: (){print('press fileCopy');}),
          IconButton(icon: Icon(Icons.person_outline, color: Colors.black,), onPressed: (){print('press personOutline');}),
        ],
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: topTabs,
        labelColor: Colors.black,

        ),
      ),
      body:  TabBarView(
        controller: _tabController,
        children: [
         TopNewsPage(),
          StatePage(),
          // Text("Sports"),
          // Text("Life & Science"),

        ],
      ),
    );
  }
}
