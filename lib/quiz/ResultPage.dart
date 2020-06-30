import 'package:FlutterWorkshop/quiz/QuizPicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int _score;
  final int _numberOfQuestions;

  ResultPage(this._score, this._numberOfQuestions);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  int _position = 1;
  AnimationController _animationController;
  Animation _animation;
  Animation _animation2;
  String _message;
  int _percentage;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.8, curve: Curves.easeInOut)));
    _animation2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 1, curve: Curves.easeInOut)));
    _percentage = (widget._score / widget._numberOfQuestions * 100).toInt();

    initMessage();
    onInit();
  }

  void onInit() {
    _animationController.forward();
  }
  void initMessage() {
    if (_percentage < 35) {
      _message = "Soooooooooooooo bad.";
    } else if (_percentage < 53) {
      _message = "You know virtually nothing.";
    } else if (_percentage < 73) {
      _message = "You know something.";
    } else if (_percentage < 91) {
      _message = "Don't get too excited.";
    } else {
      _message = "You good. You go write program. You programmer.";
    }
  }

  @override
  Widget build(BuildContext context) {
//todo add animations
    return Column(
      children: <Widget>[
        Spacer(
          flex: 4,
        ),
        AnimatedBuilder(
          animation: _animationController,
          child: Text(
            "${(widget._score / widget._numberOfQuestions * 100).toInt()}%",
            style: TextStyle(color: Colors.white70, fontSize: 90),
          ),
          builder: (context, child) {
            return Opacity(
                opacity: _animation2.value,
                child: Transform.translate(
                  offset: Offset(0, 150 * _position * (1 - _animation2.value)),
                  child: child,
                ));
          },
        ),
        AnimatedBuilder(
          animation: _animationController,
          child: Container(

            margin: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 21,
                  fontStyle: FontStyle.italic),
            ),
          ),
          builder: (context, child) {
            return Opacity(
                opacity: _animation.value,
                child: Transform.translate(
                  offset: Offset(0, 150 * _position * (1 - _animation.value)),
                  child: child,
                ));
          },
        ),
        Spacer(flex: 4),
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0, 150 * _position * (1 - _animation.value)),
                    child: child,
                  ));
            },
            child: FlatButton(
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
              onPressed: onPress,
            )),
        Spacer(
          flex: 1,
        )
      ],
    );
  }

  Future<void> onPress() async {
    if (_animationController.status == AnimationStatus.completed) {
      _position = -1;
      await _animationController.reverse();
      Navigator.pop(
        context,
      );
    } else {
      _position = 1;
      _animationController.forward();
    }
  }
}
