import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/bowling_landing_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext build){
    return new MaterialApp(
      title:"LoginTest",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
      GoogleSignInAccount currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
    // Force the user to interactively sign in
    currentUser = await _googleSignIn.signIn();
  }

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gsa.idToken,
      accessToken: gsa.accessToken
    );
  
  return user;
  }


  void _signOut(){
    _googleSignIn.signIn();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("test")
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () => _signIn()
            .then((FirebaseUser user) => 
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyBowlingLandingPage()))),
            child: new Text("sign in"),
            color: Colors.green
          ),
          new RaisedButton(
            onPressed: () => _signOut(),
            child: new Text("sign out"),
            color: Colors.green
          )
        ],
      )
    );
  }
}

