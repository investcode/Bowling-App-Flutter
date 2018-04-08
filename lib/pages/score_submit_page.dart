import 'package:flutter/material.dart';
import '../ui/title_text.dart';
import '../pages/bowling_landing_page.dart';

class MyScoreSubmitPage extends StatefulWidget {
  MyScoreSubmitPage({Text test});

  @override
  _ScoreSubmitPage createState() => new _ScoreSubmitPage();
}

class _ScoreSubmitPage extends State<MyScoreSubmitPage>{
  final TextEditingController _controller = new TextEditingController();

    @override
    Widget build(BuildContext context){
      return new Material(
        color: Colors.purpleAccent,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TitleText("Game Info"),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.all(10.0),),
                          new Text("Type in your score",style: new TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold)),
                          new TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                            hintText: 'Type Something'
                          ),
                        ),
                        new Padding(padding: new EdgeInsets.all(10.0),),
                        new RaisedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              child: new AlertDialog(
                                title: new Text("Please Check that score is correct"),
                                content: new Text(_controller.text),
                                actions: <Widget>[
                                  new RaisedButton(
                                    child: new Text("Confirm"),
                                    onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyBowlingLandingPage())),
                                  )
                                ],
                              )
                            );
                          },
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          child: new Text("Submit"),
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
