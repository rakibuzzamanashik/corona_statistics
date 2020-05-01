import 'package:flutter/material.dart';


class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);


  @override
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
    =
    query.isEmpty?
    countryList:
    countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                      Text(suggestionList[index]['country'], style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(suggestionList[index]['countryInfo']['flag'], height: 50, width: 60,),
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
                        Text("Confirmed: " + suggestionList[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red,letterSpacing: 0.2)),
                        Text("New Cases: " + suggestionList[index]['todayCases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.amber[800],letterSpacing: 0.2)),
                        Text("New Deaths: " + suggestionList[index]['todayDeaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[900],letterSpacing: 0.2)),
                        Text("Recovered: " + suggestionList[index]['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green,letterSpacing: 0.2)),
                        Text("Total Deaths: " + suggestionList[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[900],letterSpacing: 0.2)),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
          );
        });
  }

}