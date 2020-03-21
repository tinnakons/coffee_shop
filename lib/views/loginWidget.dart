import 'package:coffee_shop/controllers/loginController.dart';
import 'package:coffee_shop/models/member.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  final Member member;
  LoginWidget({
    Key key,
    @required this.member,
  }) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  Member member = new Member();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
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
      home: MyHomePage(title: 'coffee shop',member: member,),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final Member member;

  MyHomePage({Key key,
  @required this.member,
   this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Member member = new Member();
  LoginController loginController = new LoginController();
  int _counter = 0;
  final txt_username = TextEditingController();
  final txt_password = TextEditingController();

  void _incrementCounter() {
    setState(() {

      //print(member.mbUSERNAME);
      

      _counter++;
    });
  }

  void _logins() {
    setState(() {

      loginController.doLogin(txt_username.text, txt_password.text, context);

      


      //member.mbID = '12345678';

      //print(widget.member.mbUSERNAME);





      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: txt_username,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: txt_password,
              ),
            ),
            RaisedButton(
              onPressed: _logins,
              child: Text('login'),
              

            ),
            
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
            onPressed: _logins,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
