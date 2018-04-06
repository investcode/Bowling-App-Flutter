import 'package:flutter/material.dart';

//UI Elements
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

//Utils
import '../utils/question.dart';
import '../utils/quiz.dart';

//Pages
import '../pages/score_page.dart';

//Immutable
class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

//Mutable
class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon musk is human", true),
    new Question("pissa is healthy", false),
    new Question("FLutter is awesome", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    //Change state to show overlay
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null); //Erases previous routes
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
         ) : new Container()
      ],
    );
  }
}