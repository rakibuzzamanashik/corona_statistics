import 'package:coronastatistics/datasource.dart';
import 'package:coronastatistics/pages/detailsPage.dart';
import 'package:coronastatistics/pages/loadingPage.dart';
import 'package:coronastatistics/panels/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;



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

  DateTime _currentdate = new DateTime.now();


  @override
  void initState() {
    fetchWorldWideData();
    fetchBangladeshData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    String _formattedate = new DateFormat.yMMMMd().add_j().format(_currentdate);
    return Scaffold(
      //appBar: AppBar(title: Text("COVID-19  Statistics", style: TextStyle(letterSpacing: 2.0, fontSize: 22),)),

      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            //margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            alignment: Alignment.center,
            child: Image.asset('assets/coronavirus-black.png', scale: 2.3,),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: Text("Bangladesh", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
          ),

          SizedBox(height: 10),
          bangladeshData == null ? Center(child: SpinKitThreeBounce(color: primaryBlack, size: 25,)) : WorldWidePanel(worldData: bangladeshData,),

          SizedBox(height: 25,),






          Container(
            height:230,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey[350], blurRadius: 10, offset: Offset (0,4))
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Worldwide', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                      SizedBox(height: 10.0),
                      Image.asset('assets/world4.png', height: 50, width: 60,),
                    ],
                  ),
                ),
                Expanded(child: worldData==null? Center(child: SpinKitThreeBounce(color: primaryBlack, size: 20,)) : Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,6,0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Confirmed: " + worldData['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.red)),
                        SizedBox(height: 10,),
                        Text("Today: " + worldData['todayCases'].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.amber[800])),
                        SizedBox(height: 10,),
                        Text("New Deaths: " + worldData['todayDeaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blueGrey[700])),
                        SizedBox(height: 10,),
                        Text("Recovered: " + worldData['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.green)),
                        SizedBox(height: 10,),
                        Text("Total Deaths: " + worldData['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey[900])),

                      ],
                    ),
                  ),
                ),),
              ],
            ),
          ),


          SizedBox(height: 20,),


          Container(
            height:350,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey[350], blurRadius: 10, offset: Offset (0,4))
            ]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 30),
                  child: Text("Statistics of Bangladesh", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1, )),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('• New infected', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• New deaths', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• Total infected', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• Total deaths', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• Total recovered', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• Cases per 1 million', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                          Text('• Total tests', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                          SizedBox(height: 12.0),
                        ],
                      ),
                    ),

                    Container(child: bangladeshData==null? Center(child: SpinKitThreeBounce(color: primaryBlack, size: 20,)) : Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(':  + ' + bangladeshData['todayCases'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':  + ' + bangladeshData['todayDeaths'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':   ' + bangladeshData['cases'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':   ' + bangladeshData['deaths'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':   ' + bangladeshData['recovered'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':   ' + bangladeshData['casesPerOneMillion'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                            Text(':   ' + bangladeshData['tests'].toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),),
                            SizedBox(height: 12.0),
                          ],
                        ),
                      ),
                    ),
                    ),

                  ],
                ),
              ],
            ),
          ),





          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
            child: Text('Last Update: $_formattedate ', style: TextStyle(fontSize: 13, letterSpacing: 0.5),),
          ),



          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingPage()));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.refresh, color: Colors.white,),
                  SizedBox(width: 5),
                  Text("Refresh", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),



          SizedBox(height: 15),








        ],
      ),),
    );
  }
}
