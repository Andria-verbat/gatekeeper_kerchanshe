import 'dart:convert';
import 'dart:io';

import 'package:gatekeeper_kerchanshe/Screens/detail_screen.dart';
import 'package:gatekeeper_kerchanshe/Screens/history_list.dart';
import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:gatekeeper_kerchanshe/widgets/list_tile.dart';
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
                      width: 50.0,
                      /*child: new IconButton(
                        padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                        color: AppColor.green,
                        icon: new Icon(
                            Icons.power_settings_new,
                            size: 40.0
                        ),
                        onPressed: () {
                          print("power click");
                        },
                      ),*/
                      child: Image.asset('lib/assets/greenicon.png', fit: BoxFit.none),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 20.0,
                              top: 10,
                              bottom: 8),
                          child: Text('Truck status',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 10,
                              bottom: 0),
                          child: Row (
                            children: [
                              Container(
                                width: 70,
                                padding: const EdgeInsets.only(top: .5,bottom: .5, left: 35, right: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.green,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return HistoryList();
                                      },
                                      settings: RouteSettings(name: 'HistoryScreen',),
                                    ),
                                  );
                                  // Navigator.of(context).pushReplacement(
                                  //   new MaterialPageRoute(
                                  //     builder: (BuildContext context) {
                                  //       return HistoryList();
                                  //     },
                                  //   ),
                                  // );
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    color: AppColor.green1,
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: AppColor.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 10.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Text('50',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 25.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      Padding(padding: const EdgeInsets.only(
                                        right: 30.0,),
                                        child: Text('Truck',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat-Bold',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 0,),
                                      Text('Passed today',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat-Regular',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 10.0,
                                  top: 0,
                                  bottom: 20),
                              child: Text('19/01/2021',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                          top: 10,
                          bottom: 15),
                      child: Container(
                        padding: const EdgeInsets.only(top: 5,bottom: 5, left: 0, right: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColor.green1
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
                              child: Text('Truck Decline today',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Regular',
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
                              child: Text('03',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Bold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 0.0),
                      // padding: const EdgeInsets.only(top: 0,bottom: 0, left: 0, right: 0),
                      // height: MediaQuery.of(context).size.height - 410,        // USE THIS LINE FOR SCROLL ONLY THE LIST
                      child: Column (                                             // USE THIS LINE FOR SCROLL ENTIRE PAGE
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      new MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return DetailScreen();
                                        },
                                        settings: RouteSettings(name: 'DetailScreen',),
                                      ),
                                    );
                                  },
                                  child: ListTileItem(
                                      '18215'
                                          .toString()
                                          .toUpperCase(),
                                      '56554455668'
                                          .toString()
                                          .toUpperCase(),
                                    'Approved'.toString()
                                        .toUpperCase(),
                                    true,
                                  ),

                                );
                              }
                          )
                        ],
                      ),
                      /*                                                            // USE THIS LINE FOR SCROLL ONLY THE LIST
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {

                              },
                              child: ListTileItem(
                                  'Ak'
                                      .toString()
                                      .toUpperCase(),
                                  '10:30 AM'
                                      .toString()
                                      .toUpperCase()
                              ),

                            );
                          }
                      ),
                      */
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
