import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'jsonmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'keyz.dart';

class TextFieldModel extends ChangeNotifier{
  final foodController = TextEditingController();

  Future<Foodres> fetchChick() async {
    final para = foodController.value.toString().replaceAll(" ", "%20");
    final response = await http.get('https://api.edamam.com/api/nutrition-data?app_id=${Keys.App_Id}&app_key=${Keys.App_key}&ingr=$para');
    final jsonResponse = jsonDecode(response.body);
    return Foodres.fromJson(jsonResponse);
  }
  @override
  void notifyListeners();

  Widget futureWidget() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF2D3E),
      ),
      body: FutureBuilder<Foodres>(
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
      ),
    );
  }
}
