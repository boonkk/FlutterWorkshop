import 'package:flutter/material.dart';

class BigNumber extends StatelessWidget {
  int _number;

  BigNumber(this._number);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "0$_number",
            style: TextStyle(
                fontSize: 85,
                color: Colors.white70),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
