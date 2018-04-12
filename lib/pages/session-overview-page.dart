import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../pages/bowling_landing_page.dart';
import '../pages/session-page.dart';
import '../pages/session-confirmation-page.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class MySessionOverviewPage extends StatefulWidget {
  MySessionOverviewPage({Text test});

  @override
  _MySessionOverviewPage createState() => new _MySessionOverviewPage();
}

class _MySessionOverviewPage extends State<MySessionOverviewPage>{
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
              new TitleText("Session Stats"),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Column(
                        children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MySessionConfirmationPage()));
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Ok!"),
                        ),
                        new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MySessionPage()));
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Back"),
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