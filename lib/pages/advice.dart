import 'package:flutter/material.dart';


class AdvicePage extends StatefulWidget {
  @override
  _AdvicePageState createState() => _AdvicePageState();
}


class _AdvicePageState extends State<AdvicePage> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset('assets/protect.jpg'),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('• Home Care', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),),
                      ],
                    ),
                  ],
                )),
            Container(
              child: Image.asset('assets/home.jpg'),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('• Pregnancy & Breastfeeding', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),),
                      ],
                    ),
                  ],
                )),
            Container(
              child: Image.asset('assets/pregnancy.jpg'),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('• Stress Management', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),),
                      ],
                    ),
                  ],
                )),
            Container(
              child: Image.asset('assets/stress.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}