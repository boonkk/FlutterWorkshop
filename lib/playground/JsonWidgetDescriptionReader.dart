import 'dart:convert';


import 'package:flutter/services.dart';

class JsonWidgetDescriptionReader {
  final String _path = "assets/widgetDescriptions.json";

  Future<Map<String, String>> loadDataFromFile() async {
    String content = await rootBundle.loadString(_path);
    Map map = await json.decode(content);
    print(map);
    return map;
  }
}
