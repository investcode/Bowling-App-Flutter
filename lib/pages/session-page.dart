import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../pages/bowling_landing_page.dart';
import '../pages/session-overview-page.dart';
import '../pages/score_submit_page.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class MySessionPage extends StatefulWidget {
  MySessionPage({Text test});

  @override
  _MySessionPage createState() => new _MySessionPage();
}

class _MySessionPage extends State<MySessionPage>{
  final TextEditingController _controller = new TextEditingController();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> user = _auth.currentUser();
  var _firebaseUser;
    @override
    Widget build(BuildContext context){
      user.then((value) => _firebaseUser = value);
      return new Material(
        color: Colors.blueAccent,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: new EdgeInsets.symmetric(vertical: 20.0),),
            new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TitleText("New Session"),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text("Game 1", style: new TextStyle(fontSize: 25.0, color: Colors.black))
                            ]
                          )
                        ],
                      ) 
                    )
                  ],
                )
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScoreSubmitPage()));
                },
                color: Colors.purpleAccent,
                textColor: Colors.white,
                child: new Text("Add Score"),
              ),
            ],
          ),
          new Padding(padding: new EdgeInsets.symmetric(vertical: 280.0),),
          new RaisedButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MySessionOverviewPage()));
          },
          color: Colors.orangeAccent,
          textColor: Colors.white,
          child: new Text("Done Bowling"),
        )
          ],
        ),
      );
    }
  }