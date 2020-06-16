import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/LangTable.dart';

import 'JsonPageReader.dart';

class LangDifferences extends StatelessWidget {
  String _title = "Access modifiers"; // to constructor propably
  int _currentPage;
  Map pageContent;
  int _maxPage;
  var reader;
  LangDifferences(this._currentPage);

  Future<Map> loadContent() async {
    reader = JsonPageReader();
    return await reader.getPageData(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: loadContent(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            _maxPage = reader.numberOfPages;
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data["title"]),
              ),
              body: Center(
                child: LangTable(snapshot.data["title"], snapshot.data["imageFile"],
                    snapshot.data["description"]),
              ),
              backgroundColor: Colors.indigo,
              floatingActionButton: RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  if (_currentPage == _maxPage)
                    while (Navigator.canPop(context)) Navigator.pop(context);
                  else
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LangDifferences(_currentPage + 1)),
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
              backgroundColor: Colors.indigoAccent,
            );
          }
        });
  }
}
