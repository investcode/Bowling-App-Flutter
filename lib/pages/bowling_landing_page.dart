import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../ui/subtitle_text.dart';
import '../pages/score_submit_page.dart';
import '../pages/session-page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class MyBowlingLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () {
          if (_testSignInWithGoogle() != null) {
            Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new MySessionPage()));
          }
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TitleText("New Session"),
            new SubitleText("Welcome!")
          ],
        )
      ),
    );
  }
}



final _googleSignIn = new GoogleSignIn();
final _auth = FirebaseAuth.instance;

Future<String> _testSignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
  await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  return 'signInWithGoogle succeeded: $user';
}