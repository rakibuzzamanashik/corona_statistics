import 'package:coronastatistics/datasource.dart';
import 'package:coronastatistics/main.dart';
import 'package:coronastatistics/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                Text("Corona Live Update", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),
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
                  SizedBox(height: 10),
                  Text('Data Source: World Health Organization (WHO) & NovelCovid API.', style: TextStyle(fontSize: 15, letterSpacing: 1),),
                  SizedBox(height: 30),
                  Text('App Developer : Md Rakibuzzaman Ashik ', style: TextStyle( fontSize: 15, letterSpacing: 1),),
                  SizedBox(height: 5),
                  Text('email : rakibuzzaman112@gmail.com', style: TextStyle( fontSize: 15, letterSpacing: 1),),
                  SizedBox(height: 30),
                ],
              )),
        ],
      ),
    );
  }
}