import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatekeeper_kerchanshe/constants/apis.dart';
import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:http/http.dart' as http;


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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
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
              child: SingleChildScrollView(

              ),
            ),
          ],
        ),
    );
  }

}
