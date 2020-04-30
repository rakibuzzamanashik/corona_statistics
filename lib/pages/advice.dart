import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Image.asset('assets/virus-black.png', scale: 2,),
                SizedBox(height: 20),
                Text("Advice", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),
              ],
            ),
          ),

          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('App Version : 1.1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),),
                  SizedBox(height: 10),
                  Text('Description : Corona Live Update app gives you the Updated Statistics of the COVID-19 virus for the whole world. The informations are automatically updated in every 15 minutes.', style: TextStyle( fontSize: 15, letterSpacing: 1),),
                ],
              )),
        ],
      ),
    );
  }
}