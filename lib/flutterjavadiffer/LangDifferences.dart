import 'package:FlutterWorkshop/flutterjavadiffer/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/flutterjavadiffer/LangTable.dart';

import 'JsonPageReader.dart';

class LangDifferences extends StatefulWidget {
  int _currentPage;

  LangDifferences(this._currentPage);

  @override
  _LangDifferencesState createState() => _LangDifferencesState();
}

class _LangDifferencesState extends State<LangDifferences> {
  Map pageContent;
  int _maxPage;
  Language currentLang = Language.Dart;
  var reader;

  Future<Map> loadContent() async {
    reader = JsonPageReader();
    return await reader.getPageData(currentLang, widget._currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blueAccent],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          )),
      child: FutureBuilder<Map>(
          future: loadContent(),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.hasData) {
              _maxPage = reader.numberOfPages;
              return Scaffold(
                appBar: AppBar(
                  title: Text(snapshot.data["title"]),
                  backgroundColor: Colors.indigoAccent,
                ),
                body: Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: SingleChildScrollView(
                    child: Center(
                    child: LangTable(snapshot.data["title"], snapshot.data["imageFile"],
                        snapshot.data["description"]),
                  )
                ,),),
                backgroundColor: Colors.transparent,
                floatingActionButton: RaisedButton(
                  child: Text("Next"),
                  onPressed: () {
                    if (widget._currentPage == _maxPage)
                      while (Navigator.canPop(context)) Navigator.pop(context);
                    else
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LangDifferences(widget._currentPage + 1)),
                      );
                  },
                  color: Colors.indigoAccent,
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.indigoAccent,
                )),
                backgroundColor: Colors.transparent,
              );
            }
          }),
    );
  }
}
