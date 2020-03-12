//import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIController {

Future<http.Response> postRequest (String url, String data) async {

  //encode Map to JSON
  
  var body = json.encode(data);

  var client = new http.Client();
  try {
      var response = await client.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  return response;
  }
  catch (e){
    print(e);
    return null;
  } finally {
    client.close();
      //return null;
  }          

  /*
  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  

  return response;
  */
}

Future<http.Response> postRequestMap (String url, Map data) async {

  //encode Map to JSON
  
  var body = json.encode(data);

    var client = new http.Client();
    try {
      

      var response = await client.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
      );

      //print('====>' + i.toString());
      return response;
      

    }
    catch (e){
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }          

  /*
  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  return response;
  */
  
}


/*
Future<String> apiRequest(String url, String data) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(data)));
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return reply;
}
*/
}
