import 'package:coffee_shop/main.dart';
import 'package:coffee_shop/models/member.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMenu extends StatefulWidget {
  final Member member;

  HomeMenu({
    Key key,
    @required this.member,
    //this.title
  }) : super(key: key);
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  //Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //Member member = new Member();

  Future<void> _logout() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.remove('id');
     prefs.remove('status');
     prefs.remove('username');


     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashPage()));
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Coffee Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Coffee Shop'),
            actions: <Widget>[
              
              
            IconButton(
              
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                _logout();
              },

              
                
              
            ),
            ],
            
            ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.member.mbUSERNAME.toString()),
              Text(widget.member.mbID.toString()),
              Text(widget.member.mbLogin.toString()),

              // This trailing comma makes auto-formatting nicer for build methods.
            ],
          ))),
    );
  }
}
