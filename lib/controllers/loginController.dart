import 'dart:convert';
//import 'dart:js';

import 'package:coffee_shop/helpers/jsonHelper.dart';
import 'package:coffee_shop/helpers/slException.dart';
//import 'package:coffee_shop/helpers/webserviceHelpers.dart';
import 'package:coffee_shop/models/member.dart';
import 'package:coffee_shop/views/homeWidget.dart';
import 'package:coffee_shop/views/loginWidget.dart';
import 'package:coffee_shop/views/slProgressDialog.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
//import 'dart:math';
import 'package:coffee_shop/controllers/baseController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'iJSONController.dart';

class LoginController extends BaseController implements IJSONController {
  //Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SLProgressDialog pr;
  Member _member = new Member();

  var _jsondata;

  void doLogin(String username, String password, BuildContext context) async {
    try {
      getResponseMap(username, password,context);
      //print(_member.mbUSERNAME);


     
    } on SLException catch (e) {
      print(e);

      //Navigator.pop(context);
      //if(pr.isShowing()) pr.hide();
      //_showDialog("แจ้งเตือน", "ล็อคอินไม่สำเร็จ! " + e.errorMessage() + " กรุณาติดต่อศูนย์เทคโนโลยีสารสนเทศ 028074500 ต่อ 354, 357, 462", context);

    }
  }

  @override
  Future<String> getResponseMap(String mb_user, String mb_password,BuildContext context) async {
    //var rest;

    String url = 'http://172.17.80.163/rest-api-register-login-example-master/views/signin.php';
    Map map = {'username': mb_user, 'passwords': mb_password};

    http.Response response = await http.post(url,
        body: json.encode(map)); //await postRequestMap(url, map);

    Map<String, dynamic> rest = jsonDecode(response.body);
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    //var rest = '${message['status']}';

    //print(rest['status'].toString());

    if (rest['status'].toString() != 'false') {


      _member.mbID = rest['id'].toString();
      _member.mbUSERNAME = rest['username'].toString();
      _member.mbLogin = rest['status'].toString();

      setLoginPref(rest);

       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeMenu(member: _member,)));


     
      return 'true';
    } else {
      return 'false';
    }
  }

  Future<bool> setLoginPref(var rest) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      


      

      prefs.setString('id', _member.mbID);
      prefs.setString('status', _member.mbLogin);
      prefs.setString('username', _member.mbUSERNAME);
      //prefs.setString(rest['id'], _member.stdName);
      //prefs.setString(rest['id'], _member.statDsc);
      //prefs.setString(rest['id'], _member.stdGPA);
      //prefs.setString(rest['id'], _member.stdEmail);

      //print(_member.mbUSERNAME);


     

      return prefs.setString('username', rest.toString());

    }
    on Exception catch (e){
      print(e.toString());
        return false;

    } 
  }

  Future<Member> getLoginObject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Member member = new Member();

    member.mbID = prefs.getString('id') ?? '';
    member.mbLogin = prefs.getString('status') ?? '';
    member.mbUSERNAME = prefs.getString('username') ?? '';
    
   
    return member; //prefs.getString('username') ?? '';
  }


  @override
  Future<Member> getStudentJSONData(
      String jsonString, String rootKey, String childKey) async {
    // TODO: implement getStudentJSONData
    return null;
  }

  @override
  Future<Member> getStudentJSONObject(String jsonString, String rootKey) async {
    // TODO: implement getStudentJSONObject
    try {
      Member member = new Member();
      JSONHelper jsonHelper = new JSONHelper();

      Map jsonMap = jsonHelper.parseTBJSON(jsonString, rootKey);
      if (jsonMap['id'] == null || jsonMap['username'] == null) return null;

      member.mbID = jsonMap['id'];
      member.mbUSERNAME = jsonMap['username'];
      //member.mbFNAME = jsonMap['firstname'];
      //member.mbLNAME = jsonMap['lastname'];
      //member.mbEMAIL = jsonMap['email'];
      //member.mbPHONE = jsonMap['contact'];
      //member.mbBIRTH = jsonMap['birth'];


      return member;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  


}
