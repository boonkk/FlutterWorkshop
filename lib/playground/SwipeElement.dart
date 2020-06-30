import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeElement extends StatefulWidget {
  String _name;
  String _description;

  SwipeElement(this._name, this._description);

  @override
  _SwipeElementState createState() => _SwipeElementState();
}

class _SwipeElementState extends State<SwipeElement>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white38, width: 3)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget._name,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Courier"),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: DefaultTextStyle(
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: TextStyle(
                      fontFamily: "Courier",
                      fontStyle: FontStyle.italic,
                    ),
                    //todo add desription ghere
                    child: Text(
                        "a je to klasiczka ktora robi takie fajne rzeczy ze nikt nie zaprzeczi i "
                        "chuj ci w pręgierz jesteś węgierz 12345543 5345 56 a je to "
                        "klasiczka niczym zawodniczka blada twarz aurora spiewa lanie czesc marcin hejo ejo"
                        "trzy dwa zejo jejejeje hirajgołooołołoł oł o ł ł ł ł "),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
