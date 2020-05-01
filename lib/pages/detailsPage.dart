import 'package:coronastatistics/datasource.dart';
import 'package:coronastatistics/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coronastatistics/search.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Country Statistics'),),
      body: countryData==null? Center(child: SpinKitThreeBounce(color: primaryBlack, size: 20,)) : ListView.builder(itemBuilder: (context,index){
        return Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.grey[200], blurRadius: 10, offset: Offset (0,10))
          ]),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(countryData[index]['country'], style: TextStyle(fontWeight: FontWeight.bold),),
                    Image.network(countryData[index]['countryInfo']['flag'], height: 50, width: 60,),
                  ],
                ),
              ),
              Expanded(child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,5,0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("Confirmed: " + countryData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red,letterSpacing: 0.2)),
                      Text("New Cases: " + countryData[index]['todayCases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.amber[800],letterSpacing: 0.2)),
                      Text("New Deaths: " + countryData[index]['todayDeaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[900],letterSpacing: 0.2)),
                      Text("Recovered: " + countryData[index]['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green,letterSpacing: 0.2)),
                      Text("Total Deaths: " + countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[900],letterSpacing: 0.2)),
                    ],
                  ),
                ),
              ),),
            ],
          ),
        );
      },
      itemCount: countryData == null? 0 : countryData.length,),


      floatingActionButton: SizedBox(
        width: 45,
        height: 45,
        child: FloatingActionButton(
          backgroundColor: Color(0xff202c3b),
          onPressed: () {
            showSearch(context: context, delegate: Search(countryData));
          },
          child: Icon(Icons.search,),
        ),
      ),
    );
  }
}
