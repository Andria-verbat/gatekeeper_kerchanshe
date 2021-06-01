import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gatekeeper_kerchanshe/Screens/detail_screen.dart';
import 'package:gatekeeper_kerchanshe/Screens/listing_screen.dart';
import 'package:gatekeeper_kerchanshe/Screens/pin_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String newStr;
  String token;

  _checkToken() async {
    SharedPreferences preftoken = await SharedPreferences.getInstance();
    newStr = preftoken.getString('token');
    print('Check Token at Start: f');
    print(newStr);
    setState(() {
      token = newStr;
    });
    return newStr;
  }

  @override
  void initState() {
    super.initState();
   // _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
              textScaleFactor:
              data.textScaleFactor > 1.3 ? 1.3 : data.textScaleFactor),
          child: child,
        );
      },
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 11.0,
          ),
          bodyText2: TextStyle(fontSize: 12.0),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      //test github push
      home: LoginScreen(),

    );
  }
}
