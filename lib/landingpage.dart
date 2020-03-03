import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rank/spag_listview.dart';
import 'chicken_listview1.dart';
import 'beef_listview.dart';
import 'egg_listview.dart';
import 'orange_listview.dart';
import 'banana_listview.dart';
import 'avocado_listview.dart';
import 'apple_listview.dart';
import 'package:provider/provider.dart';
import 'textfield_listview.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Analyse what you eat', style: TextStyle(
          color: Colors.black, fontSize: 15
        )),
      ),
      body: Container(
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
                width: 20,
              ),
              ChangeNotifierProvider(
                create: (context) => TextFieldModel(),
                child: Container(
                  height: 50  ,
                  child: Consumer<TextFieldModel>(
                    builder: (context, model, child) {
                      return TextField(
                        onEditingComplete: () {
                          model.fetchChick();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> model.futureWidget()));
                        },
                        controller: model.foodController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "Enter Food Here",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.black26
                              )
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Popular Foods',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 250,
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChickenList()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              elevation: 20,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(child: Image.asset('assets/chicken.jpg', fit: BoxFit.fill), height: 192),
                                Container(height: 50, color: Color(0xFFFF2D3E))
                              ],
                            ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> BeefList()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(child: Image.asset('assets/beef.jpg', fit: BoxFit.fill), height: 192),
                                  Container(height: 50, color: Color(0xFFFF2D3E))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EggList()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              elevation: 20,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(child: Image.asset('assets/egg.jpg', fit: BoxFit.fill), height: 192),
                                  Container(height: 50, color: Color(0xFFFF2D3E))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SpagList()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              elevation: 20,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(child: Image.asset('assets/spag.jpg', fit: BoxFit.fill), height: 192),
                                  Container(height: 50, color: Color(0xFFFF2D3E))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Healthy Foods',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                color: Colors.white,
                width: 200,
                height: 280,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OrangeList()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    elevation: 30,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(child: Image.asset('assets/orange.jpg', fit: BoxFit.fill), height: 192),
                        Container(height: 50, color: Color(0xFFFF2D3E))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                color: Colors.white,
                width: 200,
                height: 280,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BananaList()));
                  },
                  child: Card( 
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    elevation: 30,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(child: Image.asset('assets/banana.jpg', fit: BoxFit.fill), height: 192),
                        Container(height: 50, color: Color(0xFFFF2D3E))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                color: Colors.white,
                width: 200,
                height: 280,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AvocadoList()));
                  },
                  child: Card( 
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    elevation: 30,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(child: Image.asset('assets/avocado.jpg', fit: BoxFit.fill), height: 192),
                        Container(height: 50, color: Color(0xFFFF2D3E))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                color: Colors.white,
                width: 200,
                height: 280,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AppleList()));
                  },
                  child: Card( 
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    elevation: 30,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(child: Image.asset('assets/apple.jpg', fit: BoxFit.fill), height: 192),
                        Container(height: 50, color: Color(0xFFFF2D3E))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Container(
                child: Image.network("https://developer.edamam.com/attribution/badge.js"),
              )
            ],
          ),
        ),
      ),
    );
  }
}