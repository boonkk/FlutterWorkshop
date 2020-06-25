import 'package:FlutterWorkshop/quiz/QuizWidget.dart';
import 'package:FlutterWorkshop/quiz/ResultPage.dart';
import 'package:flutter/material.dart';

import 'BigNumber.dart';
import 'ListUnit.dart';
import 'QuestionWidget.dart';

class QuizPage extends StatefulWidget {
  final int number;
  final String question;
  final List answers;
  final VoidCallback onAnswerTapped;
  final int rightAnswer;
  final bool isDone;



  const QuizPage({Key key,
      @required this.onAnswerTapped,
      @required this.number,
      @required this.question,
      @required this.answers,
      @required this.rightAnswer,
      @required this.isDone}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();

  static int getScore() {
    return _QuizPageState._score;
  }
}



class _QuizPageState extends State<QuizPage> {
  List<GlobalKey<_ItemFaderState>> keys;
  static int _score;


  @override
  void initState() {
    super.initState();
    _score = 0;
    keys = List.generate(6, (_) => GlobalKey<_ItemFaderState>());
    onInit();
  }

  void onInit() async {
    await showEverything();
  }

  Future<void> showEverything() async {
    for(GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 50));
      if(key.currentState !=null) {
        key.currentState.show();
      }
    }
    print("score:           $_score");
  }

  void onTap() async{
    for(GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 60));
      key.currentState.hide();
    }
    await Future.delayed(Duration(milliseconds: 350));
    widget.onAnswerTapped();
    showEverything();
  }

//todo add picking animation
  @override
  Widget build(BuildContext context) {
    return !widget.isDone ?  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 40,),
        ItemFader(key: keys[0],child: BigNumber(widget.number)),
              ItemFader(key: keys[1], child: QuestionWidget(widget.question)),
              Spacer(
                flex: 2,
              ),
              ...widget.answers.map((Object answer) {
                int i = widget.answers.indexOf(answer);
                return ItemFader(
                  key: keys[i + 2],
                  child: ListUnit(
                      answer.toString(),
                      widget.rightAnswer == i
                          ? () {
                              _score++;
                              onTap();
                            }
                          : onTap),
                );
              }),
        Spacer(
          flex: 1,
        ),
      ],
    )
    :
     ResultPage(_score);
  }

  int get score => _score;
}

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key key, @required this.child}) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
_animationController.dispose();
super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 150 * position * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
    );
  }

  void show() {
    setState(() => position = 1);
    _animationController.forward();
  }

  void hide() {
    setState(() => position = -1);
    _animationController.reverse();
  }
}
