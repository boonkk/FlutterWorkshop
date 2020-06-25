import 'dart:math';

import 'package:FlutterWorkshop/quiz/BigNumber.dart';
import 'package:FlutterWorkshop/quiz/JsonQuizReader.dart';
import 'package:FlutterWorkshop/quiz/QuestionWidget.dart';
import 'package:FlutterWorkshop/quiz/ResultPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

import 'ListUnit.dart';
import 'QuizPage.dart';

class QuizWidget extends StatefulWidget {
  @override
  _QuizWidgetState createState() => _QuizWidgetState();

}

class _QuizWidgetState extends State<QuizWidget> with TickerProviderStateMixin {
  int _questionNumber;
  int _numberOfQuestions;

  JsonQuizReader _jsonQuizReader;
  @override
  void initState() {
    super.initState();
    _questionNumber = 1;
  }

  Future<Map> loadQuizContent() async {
    if (_jsonQuizReader == null) _jsonQuizReader = JsonQuizReader();
    Map map = await _jsonQuizReader.getQuestion(_questionNumber);
    _numberOfQuestions = _jsonQuizReader.numberOfQuestions;
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blueAccent],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          )),
          //margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
              future: loadQuizContent(),
              builder: (context, AsyncSnapshot<Map> snapshot) {
                if (snapshot.hasData && _questionNumber <= _numberOfQuestions) {
                  return SafeArea(
                      child: AnimatedBackground(
                          vsync: this,
                          behaviour: RacingLinesBehaviour(
                              direction: LineDirection.Btt, numLines: 30),
                          //behaviour: RandomParticleBehaviour(options: ParticleOptions(particleCount: 10, maxOpacity: 0.4, baseColor: Colors.white70, spawnMaxSpeed: 20, spawnMinSpeed: 10)),
                          //behaviour: SpaceBehaviour(backgroundColor: Colors.indigo),
                          //behaviour: BubblesBehaviour(options: BubbleOptions(bubbleCount: 5, growthRate: 30, maxTargetRadius: 300, minTargetRadius: 500),),
                          child: Container(
//                            width: double.infinity,
//                            height: double.infinity,
                            margin: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: QuizPage(
                              number: _questionNumber,
                              question: snapshot.data["question"],
                              answers: snapshot.data["answers"],
                              onAnswerTapped: onAnswerTapped,
                              rightAnswer: snapshot.data["correct"],
                              isDone: false,
                            ),
                          )));
                } else if(_questionNumber > _numberOfQuestions) {
                  return ResultPage(QuizPage.getScore());
//                  return QuizPage(number: null,
//                      question: null,
//                      answers: null,
//                      onAnswerTapped: null,
//                      rightAnswer: null,
//                      isDone: true);
                } else {
                  return Container();
                }
              })),
    );
  }

  void onAnswerTapped() {
    setState(() {
      _questionNumber++;
    });
  }
}
