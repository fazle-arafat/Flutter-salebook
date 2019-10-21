import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:location_permissions/location_permissions.dart';

import 'Variables.dart';
import 'Post.dart';

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

  final Future<Post> post;

  MyHomePage({Key key, this.title, this.post}) : super(key: key);

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
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  //------------------input field validation check start----------------------------------//
  final n_text = TextEditingController();
  final p_text = TextEditingController();
  bool n_validate = false;
  bool p_validate= false;



  @override
  void dispose() {
    n_text.dispose();
    p_text.dispose();
    super.dispose();
  }




  // Login button click event
  // ignore: non_constant_identifier_names
  void LoginbuttonClick(String phonetext,String passtext) {
    SnackBar snackBar;
    if(phonetext.isEmpty && passtext.isNotEmpty) {
      //snackBar = new SnackBar(content: new Text('Opps! Phone number missing'));
      showErrorFlushbar(context,'Phone Number');

    }
    else if (phonetext.isNotEmpty && passtext.isEmpty){

      //   snackBar = new SnackBar(content: new Text('Opps! Password missing'));
      showErrorFlushbar(context,'Password');
    }
    else if (phonetext.isEmpty && passtext.isEmpty){
      //snackBar = new SnackBar(content: new Text('Opps! Phone number & Password Missing'));
      showErrorFlushbar(context,'Phone Number & Password');
    }
    else{
      // snackBar = new SnackBar(content: new Text('Checking validation, Please wait...'));
      showInfoFlushbar(context);
      pushLogin(phonetext,passtext);
    }

    // mScaffoldState.currentState.showSnackBar(snackBar);
  }
//Check Login
  //Params: email/phone, password, gpslat, gpslong,imei
  void pushLogin(String phonetext, String passtext) async {
    PermissionStatus chkpermission = await LocationPermissions().checkPermissionStatus();
    Variables localvariables = new Variables();
    localvariables.locationList = new List();
    if(chkpermission!=null){
      print("Login clicked\t\t"+chkpermission.toString());

     // getUserLocation();


      //List<double> _locationList = new List();
      geolocator.Position position = await geolocator.Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      // locationcordinate.add(position.latitude);
      // locationcordinate.add(position.longitude);
      localvariables.locationList.add(position.latitude);
      localvariables.locationList.add(position.longitude);
      localvariables.latitude=position.latitude;
      localvariables.longitude=position.longitude;
      print('Passing prams\t' +phonetext+'\t'+passtext+'\t'+ localvariables.latitude.toString() +'\t'+localvariables.longitude.toString() );


     // var currentlocation=  await getUserLocation();
     // print ("Your current location is "+currentlocation.toString());




    }
    else {
      PermissionStatus requestPermission = await LocationPermissions().requestPermissions();
    }



  }
  getUserLocation () async {
    List<double> _locationList = new List();
    geolocator.Position position = await geolocator.Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
   // locationcordinate.add(position.latitude);
   // locationcordinate.add(position.longitude);
    _locationList.add(position.latitude);
    _locationList.add(position.longitude);
    print(position);
    return _locationList;
  }

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

    final phoneFeild= Material(
      elevation: 10.0,
      shadowColor: Colors.white30,
      child: TextFormField(
        controller: n_text,
        obscureText: false,
        autofocus: true,
        decoration: InputDecoration(
            icon: new Icon(Icons.phone, color: Color(0xff224597)),

            hintText: 'Your Phone Number',
            errorText: n_validate ? 'Phone Number Can\'t Be Empty' : null,
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(11.0),
                borderSide: BorderSide(color: Colors.white, width: 3.0))
        ),
      ),
    );
    final passFeild= Material(
      elevation: 10.0,
      shadowColor: Colors.white30,
      child: TextFormField(
        controller: p_text,

        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
            icon: new Icon(Icons.lock_open, color: Color(0xff224597)),
            hintText: 'Password',
            errorText: p_validate ? 'Phone Number Can\'t Be Empty' : null,
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(11.0),
                borderSide: BorderSide(color: Colors.white, width: 3.0))
        ),
      ),
    );
/*
    final loginsnackBar=SnackBar(
      content: Text('Yah! A snackbar'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){

        },
      ),
    );
    */



    final loginButon = Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(11.0),
      shadowColor: Colors.blue,
      color: Color(0xffFFFFFF),
      child : OutlineButton(
          borderSide: BorderSide(
            color: Colors.red, //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 0.8, //width of the border
          ),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),

            onPressed: () async{
              LoginbuttonClick(n_text.text,p_text.text);
              /* setState(() {
              n_text.text.isEmpty ? n_validate = true : n_validate = false;
              p_text.text.isEmpty ? p_validate = true : p_validate = false;
            });*/

            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
          )
      ),

    );

    return Scaffold(
        key: mScaffoldState,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.maxFinite,
              height: 1024.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    phoneFeild,
                    SizedBox(height: 1.0),
                    passFeild,

                    SizedBox(
                      height: 30.0,
                    ),
                    loginButon,

                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }


}
void main() => runApp(MyApp());