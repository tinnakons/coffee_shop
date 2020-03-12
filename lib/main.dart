import 'package:coffee_shop/controllers/loginController.dart';
import 'package:coffee_shop/models/member.dart';
import 'package:coffee_shop/views/homeWidget.dart';
import 'package:coffee_shop/views/loginWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp
                                            , DeviceOrientation.portraitDown])
    .then((_) {
      runApp(new MaterialApp(
                          home:SplashPage()
                          )
                          );
    });
}



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  LoginController loginController = new LoginController();
  Member member = new Member();
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      loadingText: Text('LOADING...',
      style: new TextStyle(
        fontFamily: 'THSarabunNew',
        fontWeight: FontWeight.bold,
        fontSize: 16.0
      ),),
      seconds: 4,
      navigateAfterSeconds: LoginWidget(member: member),//Dashboard()
      title: new Text('Coffee Shop',
      style: new TextStyle(
        fontFamily: 'THSarabunNew',
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image(
        image: new AssetImage('assets/images/coffee-logo.png'),
        fit: BoxFit.contain,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 120.0,
      loaderColor: Colors.red[300],
    );
  }
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: LoginWidget(),//Dashboard()
      title: new Text('LOADING...',
      style: new TextStyle(
        fontFamily: 'THSarabunNew',
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image(
        image: new AssetImage('assets/images/logo_coffee.jpg'),
        fit: BoxFit.contain,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 120.0,
      loaderColor: Colors.blueGrey
    );
    /*return MaterialApp(
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
      home: MyHomePage(title: 'Coffee Shop'),
    );*/
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Member member = new Member();
  LoginController loginController = new LoginController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      

      _counter++;
    });
  }

  void _logins() {
    setState(() {

      loginController.doLogin('tinnakonp', '7678', context);

      //member.mbID = '12345678';

      //print(member.mbID);





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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _logins,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
