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
        color: Colors.purpleAccent,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TitleText("Session Page"),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Column(
                        children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScoreSubmitPage()));
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Add Score"),
                        ),
                        new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MySessionOverviewPage()));
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Done Bowling"),
                        ),
                        new Padding(padding: new EdgeInsets.all(10.0),),
                        ],
                      ) 
                    )
                  ],
                )
              )
            ],
          ),
      );
    }
  }