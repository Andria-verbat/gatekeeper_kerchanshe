import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatekeeper_kerchanshe/Screens/pin_entry.dart';
import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loadingBool = false;


  _displayErSnackBar(BuildContext context, String _msg) {
    final snackBar = SnackBar(
      content: Text(_msg),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<http.Response> getRegisterd(String pswd) async {
    return http.post(Apis.login,

        body: {
          'license_no': 'ASDF-ZSFV-DFCG-HYTH',
          'pin_no': '6666',
          'imie': '9966ghgghgh9999',
        }).then(
      (http.Response response) async {
        final int statusCode = response.statusCode;
        if (statusCode == 200) {
          setState(
            () {
              final jsonResponse = json.decode(response.body);
              print(jsonResponse);
              var data = jsonResponse['data'];
              var msg = jsonResponse['message'];
              var status = jsonResponse['status'];
              if (status == true) {

                print("Login api Successful");
              } else if (msg.toString() == 'Email Already Exist') {
                setState(() {
                  loadingBool = false;
                  _displayErSnackBar(context, msg.toString());
                });
              } else {
                setState(() {
                  loadingBool = false;
                  _displayErSnackBar(context, 'Login unsucessful..');
                });
              }
            },
          );
        } else {
          _displayErSnackBar(context, 'Login unsucessful..');
          print('Login api error');
          throw Exception("Login api error!");
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: RotatedBox(
              quarterTurns: 4,
              child: Image.asset(
                'lib/assets/login_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(

                      child: Image.asset(
                        'lib/assets/greenicon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      'Buna Dhuga',
                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 28,
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 7,
                      color: AppColor.green,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Warehouse Management',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 18,
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                    SizedBox(height: 120),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 20, 20, 5),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: AppColor.lightgrey,
                                  width: 1,
                                )
                            ),

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Image.asset('lib/assets/key.png'),
                                    //SizedBox(width: 10),
                                 Text(
                                  'License Key',
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    fontFamily: 'Montserrat-Bold',

                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          3 /
                                          4,
                                      color: Colors.white,
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your email/username';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(

                                          hintText: 'Eg: 12bh54122ht',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 2,
                                            fontFamily: 'Montserrat-Regular',
                                            fontWeight: FontWeight.w500,

                                          ),

                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 12.0,
                                              top: 0.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                                color: Colors.grey[300]),
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[300]),
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                                color: Colors.grey[300]),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,

                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    color: AppColor.green,
                                    onPressed: () {
                                      setState(() {
                                        loadingBool = true;
                                      });
                                      if (passwordController.text.length == 16) {
                                        Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return PinEntryScreen(
                                          passwordController.text);
                                            },
                                          ),
                                        );
                                      } else {
                                        _displayErSnackBar(
                                            context, 'Please enter your license key');
                                      }
                                    },
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Montserrat-Bold',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(),

                              ],

                            ),

                          ),

                        ),
                        SizedBox(height: 100),
                       Text(

                           'KERCHANSHE TRADING PLC',
                           style: TextStyle(
                             color: AppColor.darkgrey,

                             fontSize: 14,
                             letterSpacing: 1,
                             fontFamily: 'Montserrat-Bold',

                           ),
                         ),


                       // SizedBox(height: 10),
                        Text(
                          'version v1.0',
                          style: TextStyle(
                            color: AppColor.darkgrey,
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
