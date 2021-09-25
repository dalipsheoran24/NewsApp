import 'file:///C:/Users/hp/AndroidStudioProjects/dainik_bhaskar/lib/model/routs_widget.dart';
import 'package:dainik_bhaskar/widgetHome_page/home_page.dart';
import 'package:dainik_bhaskar/widgetHome_page/news_openPage.dart';
import 'package:dainik_bhaskar/widget_statePage/state_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routes: {
        Routes.HOME: (context) => HomePage(),
        Routes.SECOND: (context) => NewsOpenPage(),
      },
      //  home: HomePage(),
    );

  }
}
