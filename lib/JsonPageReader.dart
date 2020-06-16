import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class JsonPageReader {
  Map map;
  int _numberOfPages;

  Future<String> _getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<Map> _readData() async {
    String data = await _getFileData("assets/dartPages.json");
    return json.decode(data);
  }

  Future<Map> getPageData(int page) async {
    map = await _readData();
    print("Page to read $page");
    _numberOfPages = map.length;
    return map["page$page"];
  }

  int get numberOfPages => _numberOfPages;
}