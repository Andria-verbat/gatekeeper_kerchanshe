import 'dart:convert';
import 'dart:io';

import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _displayErSnackBar(BuildContext context, String _msg) {
    final snackBar = SnackBar(
      content: Text(_msg),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  void initState() {
    super.initState();
    // _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //WE MUST USE Scaffold AS METERIAL WIDGET, IF WE START DESIGNING A VIEW WE MUST DECLARE Scaffold UNLESS MAKES ERROR
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // CrossAxisAlignment.start, IS USE TO PLACE AN OBJECT IN THE START POSITION
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // CrossAxisAlignment.start, IS TO MAINTANE PROPER SPACE FROM THE FIRST
                      children: [
                        SizedBox(
                          // USE OF SIZEDBOX IS TO MAKE PROPER SPACE AROUND THE ICON
                          height: 100.0,
                          width: 100.0,
                          child: new IconButton(
                            padding: new EdgeInsets.fromLTRB(0, 0, 45, 0),
                            color: AppColor.white,
                            icon: new Icon(
                                Icons.arrow_back,
                                size: 40.0
                            ),
                            onPressed: () {
                              print("back click");
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // CrossAxisAlignment.start, IS USE TO PLACE AN OBJECT IN THE END POSITION
                          children: [
                            SizedBox(
                              // USE OF SIZEDBOX IS TO MAKE PROPER SPACE AROUND THE ICON
                              height: 100.0,
                              width: 100.0,
                              child: new IconButton(
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: AppColor.white,
                                icon: new Icon(
                                    Icons.power_settings_new,
                                    size: 40.0
                                ),
                                onPressed: () {
                                  print("power click");
                                },
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                    SizedBox(
                      // USE OF SIZEDBOX IS TO MAKE PROPER SPACE AROUND THE ICON
                      height: 50.0,
                      width: 80.0,
                      child: new IconButton(
                        padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                        color: AppColor.white,
                        icon: new Icon(
                            Icons.power_settings_new,
                            size: 40.0
                        ),
                        onPressed: () {
                          print("power click");
                        },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 20.0,
                              top: 24,
                              bottom: 8),
                          child: Text('Truck status',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto-Bold',
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 0.0,
                            top: 10,
                            bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: Colors.orange,
                            ),
                            padding: const EdgeInsets.only(top: 5,bottom: 5, left: 30, right: 20),
                            child: Text(
                              'HISTORY',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),

                  ],
                ),

            ),
          ],
        ),
      ),

    );
  }

}
