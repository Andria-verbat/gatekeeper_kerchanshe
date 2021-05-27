import 'dart:convert';
import 'dart:io';

import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:gatekeeper_kerchanshe/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

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
              color: Colors.white,
              child: RotatedBox(
                quarterTurns: 4,
                child: Image.asset(
                  'lib/assets/listing_bg.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(                                                // USE THIS LINE FOR SCROLL ENTIRE PAGE
                physics: ScrollPhysics(),                                         // USE THIS LINE FOR SCROLL ENTIRE PAGE
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
                          height: 60.0,
                          width: 100.0,
                          child: new IconButton(
                            padding: new EdgeInsets.fromLTRB(0, 0, 45, 0),
                            color: AppColor.black,
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
                                height: 50.0,
                                width: 50.0,
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
                        color: AppColor.green,
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
                          padding: const EdgeInsets.only(
                              left: 20.0,
                              top: 10,
                              bottom: 8),
                          child: Row (
                            children: [
                              Text('Request No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto-Bold',
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('18215',
                                style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'Roboto-Bold',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 70,
                                padding: const EdgeInsets.only(top: .5,bottom: .5, left: 35, right: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.green,
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                          top: 10,
                          bottom: 0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 5,bottom: 5, left: 0, right: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.lightGreen[200],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0,
                                      right: 0.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Container No',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Driver ID',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Driver Name',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Plate No',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('DELIVARY DATE',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0,
                                      right: 0.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('56897',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 60.0,
                                          maxWidth: MediaQuery.of(context).size.width - 200,
                                          minHeight: 20.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: Text('KER-16236',
                                          style: TextStyle(
                                            color: Colors.black,
                                            // fontFamily: 'Roboto-Bold',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('John Doe',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('ETP8978',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('05/12/2020',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'Roboto-Bold',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                          top: 0,
                          bottom: 15),
                      child: Container(
                        padding: const EdgeInsets.only(top: 5,bottom: 5, left: 0, right: 0),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColor.green
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 10.0,
                                  top: 10,
                                  bottom: 10),
                              child: Text('APPROVED BY',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto-Bold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 0.0,
                                  top: 10,
                                  bottom: 10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                  maxWidth: 40,
                                  maxHeight: 40,
                                ),
                                child: Image.asset('lib/assets/k.png', fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                          top: 10,
                          bottom: 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('NATHEM LIAM',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                          top: 15,
                          bottom: 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: RawMaterialButton(
                          fillColor: AppColor.green,
                          // splashColor: Colors.greenAccent,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: 300,
                              height: 40,
                              padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "PASS",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto-Bold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: (){
                            print ('Tab Btn');
                          },
                          shape: const StadiumBorder(),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                          top: 15,
                          bottom: 0),
                      child: Align(
                          alignment: Alignment.center,
                          child: RawMaterialButton(
                            fillColor: Colors.grey[400],
                            // splashColor: Colors.greenAccent,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: 300,
                                height: 40,
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "DECLINE",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: (){
                              print ('Tab Btn');
                            },
                            shape: const StadiumBorder(),
                          )
                      ),
                    ),

                    SizedBox(
                      height: 30,
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
