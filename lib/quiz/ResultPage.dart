import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int _score;

  ResultPage(this._score);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;
  Animation _animation2;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.8, curve: Curves.easeInOut)));
    _animation2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 1, curve: Curves.easeInOut)));
    onInit();
  }

  void onInit() {
    _animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
//todo add animations
    return Column(children: <Widget>[
      Spacer(),
      AnimatedBuilder(animation: _animationController,
        child:Text("0${widget._score}", style: TextStyle(color: Colors.white70, fontSize: 90),),
        builder: (context, child){
        return Opacity(opacity: _animation.value,
            child: Transform.translate(offset: Offset(0,150),child: Transform.translate(offset: Offset(0, -_animation.value*150), child: child,)));
      },),
      AnimatedBuilder(animation: _animationController,
        child: Text("points",style: TextStyle(color: Colors.white70, fontSize: 30),),
        builder: (context, child){
        return Opacity(opacity: _animation2.value,
            child: Transform.translate(offset: Offset(0,150),child: Transform.translate(offset: Offset(0, -_animation2.value*150), child: child,)));
      },),


      FlatButton(child: Text("presssiksis"), onPressed: onPress,),
      Spacer()
    ],);
  }

  void onPress() {
    if(_animationController.status == AnimationStatus.completed)
    _animationController.reverse();
    else
      _animationController.forward();
  }

}
