import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salebook.',
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
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {



  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();

  //flush bar
  void showErrorFlushbar(BuildContext context, String phone_pass) {
    Flushbar(
      title: 'Warnning!',
      message: phone_pass+'\t is missing',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.red.shade300,
      ),
      leftBarIndicatorColor: Colors.red.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showWarnFlushbar(BuildContext context) {
    Flushbar(
      title: 'Opps!',
      message: 'Loagin faild, check you network or contact with administrator',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.yellow.shade300,
      ),
      leftBarIndicatorColor: Colors.yellowAccent,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Checking!',
      message: 'checking validation, please wait...',
      icon: Icon(
        Icons.check,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }
//------------------input field validation check end----------------------------------//






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return null;
    return Scaffold(
        key: mScaffoldState,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      )
    );
  }
}