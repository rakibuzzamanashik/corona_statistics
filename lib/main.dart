import 'package:coronastatistics/datasource.dart';
import 'package:coronastatistics/pages/homepage.dart' as first;
import 'package:coronastatistics/pages/detailsPage.dart' as second;
import 'package:coronastatistics/pages/aboutPage.dart' as fourth;
import 'package:coronastatistics/pages/advice.dart' as third;
import 'package:coronastatistics/pages/loadingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryBlack,
      ),
      home: LoadingPage()
  ));
}









class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text("Corona Live Update", style: TextStyle(letterSpacing: 2.0, fontSize: 22),),
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(text: 'Brief',),
            new Tab(text: 'World',),
            new Tab(text: 'Advice'),
            new Tab(text: 'About'),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          new first.HomePage(),
          new second.Details(),
          new third.AdvicePage(),
          new fourth.AboutPage(),
        ],
      ),
    );
  }
}