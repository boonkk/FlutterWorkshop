import 'dart:convert';
import 'dart:io';

import 'package:FlutterWorkshop/flutterjavadiffer/Language.dart';
import 'package:flutter/services.dart';

class JsonQuizReader {
  Map map;
  int _numberOfQuestions;

  Future<String> _getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<Map> _readData(String filename) async {
    String data;

      data = await _getFileData("assets/quiz1.json");
      //data = await _getFileData("assets/$filename");
    return json.decode(data) as Map;
  }

  Future<Map> getQuestion(int question) async {
    if(map == null) {
      map = await _readData("FILENAME IS IGNORED RIGHT NOW");
      }

    _numberOfQuestions = map.length;
    return map["question$question"];
  }

  int get numberOfQuestions => _numberOfQuestions;
}