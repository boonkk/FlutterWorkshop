import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {

  String _question;

  QuestionWidget(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        _question,
        maxLines: 5,
        style: TextStyle(
            color: Colors.white70, fontSize: 27),
      ),
    );
  }
}
