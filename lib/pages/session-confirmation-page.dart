import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../pages/bowling_landing_page.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class MySessionConfirmationPage extends StatefulWidget {
  MySessionConfirmationPage({Text test});

  @override
  _MySessionConfirmationPage createState() => new _MySessionConfirmationPage();
}

class _MySessionConfirmationPage extends State<MySessionConfirmationPage>{
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
              new TitleText("Stats Recorded"),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Column(
                        children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyBowlingLandingPage()));
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Exit"),
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