import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:requests/requests.dart';
import 'jsonmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Foodres> fetchChick() async {
  final response = await http.get('https://api.edamam.com/api/nutrition-data?app_id=2fee8088&app_key=91f50b7cadb87e4855057006e371ef2a&ingr=one%20banana');
  final jsonResponse = jsonDecode(response.body);
  return Foodres.fromJson(jsonResponse);
}

class BananaList extends StatefulWidget {
  @override
  _BananaListState createState() => _BananaListState();
}

class _BananaListState extends State<BananaList> {
  Widget futureWidget() {
    return new FutureBuilder<Foodres>(
        future: fetchChick(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List work = [];
            snapshot.data.totalNutrients.forEach((k, v)=> work.add('${k}: ${v.quantity.toString()}, ${v.label.toString()}, ${v.unit.toString()}'));
            return new Container(
                color: Colors.white70,
                padding: new EdgeInsets.all(18),
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Calories',
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),
                          Text(
                              "${snapshot.data.calories.toString()}"
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Diet Labels',
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),
                          Text(
                              "${snapshot.data.dietLabels.join(', ')}"
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Health Labels',
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),
                          Text(
                              "${snapshot.data.healthLabels.join(', ')}"
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Total Nutrients',
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),
                          Text(
                              '${work.join(', \n\n')}'
                          )
                        ],
                      ),
                    )
                  ],
                )
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: new CircularProgressIndicator());
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF2D3E),
      ),
      body: futureWidget(),
    );
  }
}