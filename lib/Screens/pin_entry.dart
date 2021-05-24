// import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';


class PinEntryScreen extends StatefulWidget {
  final String pin;
  PinEntryScreen(this.pin);
  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loadingBool = false;
  String currentText;
  String apiTtoken;
  String _platformImei = 'Unknown';
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String _identifier;
  String uniqueId = "Unknown";

  _displayErSnackBar(BuildContext context, String _msg) {
    final snackBar = SnackBar(
      content: Text(_msg),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _setToken(String _token) async {
    SharedPreferences preftoken = await SharedPreferences.getInstance();
    setState(() {
      preftoken.setString('token', _token);
      print('Token');
      print(_token);
    });
    // _checkToken();
  }

  Future<http.Response> getRegisterd(String pswd) async {
    return http.post(Apis.login, headers: {
      "Accept": "application/json",
      "api-key": "U6eCAvOn1OLWlSPgyhPTHOEq2YNRpNR3",
    }, body: {
      'license_no': this.widget.pin.toString(),
      'pin_no': currentText.toString(),
      'imie': _identifier.toString(),
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

              print('Token REceived');
              print(apiTtoken);
              if (status == true) {
                apiTtoken = jsonResponse['data']['user_api_token'].toString();
                _setToken(apiTtoken.toString());
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(),
                  ),
                );*/
                print("Login api Successful");
              } else if (msg.toString() == 'Email Already Exist') {
                setState(() {
                  loadingBool = false;
                  _displayErSnackBar(context, msg.toString());
                });
              } else {
                setState(() {
                  loadingBool = false;
                  _displayErSnackBar(context, msg.toString());
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

  Future<void> initUniqueIdentifierState() async {
    String identifier;
    if (Platform.isAndroid) {
      var build = await deviceInfo.androidInfo;
      identifier = build.androidId;
      setState(() {
        _identifier = identifier;
        print('ID iOS');
        print(_identifier);
      });
    } else if (Platform.isIOS) {
      var data = await deviceInfo.iosInfo;
      identifier = data.identifierForVendor;
      setState(() {
        _identifier = identifier;
        print('ID iOS');
        print(_identifier);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initUniqueIdentifierState();
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
            color: Colors.blue,
            child: RotatedBox(
              quarterTurns: 4,
              child: Image.asset(
                'lib/assets/bg1.jpg',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'lib/assets/big_k.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'management',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      'information',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      'system',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 1.9,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 3),
                    Text(
                      'KERACHANSHE TRADING PLC',
                      style: TextStyle(
                        color: AppColor.cyanButton,
                        fontSize: 15,
                        letterSpacing: 2,
                        fontFamily: 'FuturaMediumCondensedBT',
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Color(0xff1C3C7B),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PIN NUMBER',
                                      style: TextStyle(
                                        color: AppColor.cyanButton,
                                        fontSize: 23,
                                        letterSpacing: 1.5,
                                        fontFamily: 'FuturaMediumCondensedBT',
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Image.asset('lib/assets/pin.png'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          3.3 /
                                          4,
                                      child: Form(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 30),
                                          child: PinCodeTextField(
                                            appContext: context,
                                            pastedTextStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            length: 4,
                                            obscureText: false,
                                            obscuringCharacter: '*',
                                            animationType: AnimationType.fade,
                                            validator: (v) {
                                              if (v.length < 4) {
                                                return "Please enter your 4 digit pin number";
                                              } else {
                                                return null;
                                              }
                                            },
                                            pinTheme: PinTheme(
                                              shape:
                                                  PinCodeFieldShape.underline,
                                              disabledColor: Colors.grey,
                                              inactiveColor: Colors.grey,
                                              activeColor: Colors.blue,
                                              fieldHeight: 60,
                                              fieldWidth: 30,
                                            ),
                                            cursorColor: Colors.white,
                                            animationDuration:
                                                Duration(milliseconds: 300),
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                height: 1.6),
                                            backgroundColor: Color(0xff1C3C7B),
                                            keyboardType: TextInputType.number,
                                            onCompleted: (v) {
                                              print("Completed");
                                            },
                                            onChanged: (value) {
                                              print(value);
                                              setState(() {
                                                currentText = value;
                                              });
                                            },
                                            beforeTextPaste: (text) {
                                              print("Allowing to paste $text");

                                              return true;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: RaisedButton(
                            color: AppColor.cyanButton,
                            onPressed: () {
                              if (currentText != null) {
                                getRegisterd(currentText);
                              } else {
                                _displayErSnackBar(
                                    context, 'Please enter your pin number');
                              }
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Roboto-Bold',
                              ),
                            ),
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
