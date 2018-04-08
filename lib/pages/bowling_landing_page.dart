import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../ui/subtitle_text.dart';
import '../pages/score_submit_page.dart';
import '../pages/landing_page.dart';

class MyBowlingLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScoreSubmitPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TitleText("Click Me!"),
            new SubitleText("On towards the app")
          ],
        ),
      ),
    );
  }
}