import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../ui/subtitle_text.dart';
import '../pages/session-page.dart';
import '../pages/login-page.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class MyBowlingLandingPage extends StatefulWidget {
  State createState() => new _MyBowlingLandingPage();
}

class _MyBowlingLandingPage extends State<MyBowlingLandingPage>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await _googleSignIn.signInSilently();
  }
  if (currentUser == null) {
    // Force the user to interactively sign in
    currentUser = await _googleSignIn.signIn();
  }

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  // Authenticate with firebase
  final FirebaseUser user = await _auth.signInWithGoogle(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );

  return user;
}


  void _signOut(){
    _googleSignIn.signIn();
  }

@override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in
    _auth.onAuthStateChanged
        .firstWhere((user) => user != null)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/todos');
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 1))
        .then((_) => signInWithGoogle());
  }

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new MySessionPage()));
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TitleText("New Session"),
            new SubitleText("Welcome!"),
            new RaisedButton(
            onPressed: () {
              _signOut();
              Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new LoginPage()));
            },
            child: new Text("sign out"),
            color: Colors.green
          )
          ],
        )
      ),
    );
  }
}