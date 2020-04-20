import 'package:coronastatistics/datasource.dart';
import 'package:coronastatistics/main.dart';
import 'package:coronastatistics/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Map bangladeshData;
  fetchBangladeshData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/countries/50");
    setState(() {
      bangladeshData = json.decode(response.body);
    });
  }


  @override
  void initState() {
    fetchWorldWideData();
    fetchBangladeshData();
    moveToHome();
    super.initState();
  }

  void moveToHome() async {
    await fetchBangladeshData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyTabs()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4b5f78),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/coronavirus-white.png', scale: 3,),
          SizedBox(height: 70.0),
          SpinKitRipple(
            color: Colors.white,
            size: 85.0,
          ),
          SizedBox(height: 10.0),
          Text(
            "Loading Data",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}