import 'dart:convert';
//import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;

class JSONHelper {
  Map<String, dynamic> parseTBJSON(String jsonString, String key) {
    try{
      String jsonStringFormat = '''''' + jsonOnlyContent(jsonString) + '''''';  
      //String jsonData = "";
      Map decoded = jsonDecode(jsonStringFormat);

      //Map childDecoded = jsonDecode(decoded[key]);
      
      return decoded[key]; //jsonData[4];

    }
    catch(e){
      return null;
    }

  }

  String jsonOnlyContent(String jsonString){

    if(jsonString == null) return null;
    String onlyContent = "";
    onlyContent = jsonString.substring(jsonString.indexOf('{"content"'));
    onlyContent = onlyContent.replaceAll('"}}', '"}');

    return onlyContent;

  }
}