import 'dart:convert';
import 'dart:io';

import 'package:FlutterWorkshop/Language.dart';
import 'package:flutter/services.dart';

class JsonPageReader {
  Map map;
  int _numberOfPages;

  Future<String> _getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<Map> _readData(Language language) async {
    String data;
    if(language == Language.Dart)
      data = await _getFileData("assets/dartPages.json");
    else
      data = await _getFileData("assets/javaPages.json");

    return json.decode(data);
  }

  Future<Map> getPageData(Language language, int page) async {
    map = await _readData(language);
    print("Page to read $page");
    _numberOfPages = map.length;
    return map["page$page"];
  }

  int get numberOfPages => _numberOfPages;
}