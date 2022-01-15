import 'package:flutter/material.dart';
import 'Quiz_Brain.dart';
import 'Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      );
    }
  }




class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [

  ];


  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  //
  // ];
  // List<bool> answers = [false , true ,true];

  // Question q1 = Question('You can lead a cow down stairs but not up stairs.', false);

  int questionnumber = 0;
  List<Icons> l1 , l2 ,l3 = [];








  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(questionnumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctanswer = quizbrain.getCurrectAnswer(questionnumber);
                if (correctanswer == true) {
                  print('answer is right');
                } else {
                  print('answer is wrong');
                }

                setState(() {
                  
                  if (questionnumber < 12) {
                    questionnumber++;
                  } else {

                    Alert(
                      
                      context: context,
                      type: AlertType.error,
                      title: "RFLUTTER ALERT",
                      desc: "Flutter is more awesome with RFlutter Alert.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: ()  {Navigator.pop(context ,true);},
                          width: 120,
                        )
                      ],
                    ).show();
                  }

                  if (correctanswer == true) {
                    scorekeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.lightGreenAccent,
                      ),
                    );
                  } else {
                    scorekeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  ;
                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: ()

              {



                bool correctanswer = quizbrain.getCurrectAnswer(questionnumber);
                if (correctanswer == false) {
                  print('answer is right');
                } else {
                  print('answer is wrong');
                }

                setState(() {
                  if (questionnumber < 12) {
                    questionnumber++;

                  } else {

                    questionnumber = 0;

                  }

                  if (correctanswer == false) {
                    scorekeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.lightGreenAccent,
                      ),
                    );
                  } else {
                    scorekeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                }); //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )


      ],
    );
  }
}

