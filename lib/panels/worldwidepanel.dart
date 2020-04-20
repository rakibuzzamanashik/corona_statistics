import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.4),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.deepOrange[300],
            textColor: Colors.red[800],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'NEW CASES',
            panelColor: Colors.amber[300],
            textColor: Colors.deepOrange,
            count: worldData['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green[700],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.blueGrey[200],
            textColor: Colors.grey[900],
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8,5,8,5),
      child: Card(
        elevation: 3.0,
        child: Container(
          height: 80, width: width/2,
          color: panelColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor, letterSpacing: 0.7)),
              //SizedBox(height: 2.0),
              Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: textColor, letterSpacing: 1)),
            ],
          ),
        ),
      ),
    );
  }
}

