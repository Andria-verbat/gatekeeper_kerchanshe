import 'dart:typed_data';

import 'package:gatekeeper_kerchanshe/constants/colors.dart';
import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final String requestNoString;
  final String containerNoString;
  final String approvedString;
  final bool isPass;
  // final Uint8List imagE;
  ListTileItem(
      this.requestNoString,
      this.containerNoString,
      this.approvedString,
      this.isPass,
      // this.imagE,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white.withOpacity(0),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 8,
          right: 8,
        ),
        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   color: Colors.grey[300],
          //   borderRadius: BorderRadius.circular(20),
          // ),
          child: Center(
            child: ListTile(
              // leading: CircleAvatar(
              //   backgroundColor: Color(0xff0D1745),
              //   radius: 25,
              //   child: CircleAvatar(
              //     radius: 16,
              //     backgroundColor: Colors.transparent,
              //     child: imagE.toString().length > 0
              //         ? Image.memory(
              //       this.imagE,
              //       scale: .5,
              //     )
              //         : SizedBox(),
              //   ),
              // ),
              title: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.lightgrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 0.0,
                            top: 0,
                            bottom: 0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                              maxWidth: 40,
                              maxHeight: 40,
                            ),
                            child: Image.asset('lib/assets/truck.png', fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 20.0,
                                    maxWidth: 100.0,
                                    minHeight: 20.0,
                                    maxHeight: 100.0,
                                  ),
                                  child: Text(
                                    "Request No: ",
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 20.0,
                                    maxWidth: 90.0,
                                    minHeight: 20.0,
                                    maxHeight: 100.0,
                                  ),
                                  child: Text(
                                    this.requestNoString,
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "Request No: ",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.normal,
                                //     fontSize: 20,
                                //     letterSpacing: 0,
                                //   ),
                                // ),
                                // Text(
                                //   this.requestNoString,
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 20,
                                //     letterSpacing: 0,
                                //   ),
                                // ),
                              ],
                            ),
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 20.0,
                                    maxWidth: 90.0,
                                    minHeight: 20.0,
                                    maxHeight: 100.0,
                                  ),
                                  child: Text(
                                    "Container No: ",
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 20.0,
                                    maxWidth: 85.0,
                                    minHeight: 20.0,
                                    maxHeight: 80.0,
                                  ),
                                  child: Text(
                                    this.containerNoString,
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "Container No: ",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 12,
                                //     letterSpacing: 0,
                                //   ),
                                // ),
                                // Text(
                                //   this.containerNoString,
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.normal,
                                //     fontSize: 12,
                                //     letterSpacing: 0,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                          top: 0,
                          bottom: 0),
                      child: Row(

                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0,
                                bottom: 0),
                            child: Container(
                              height: 90,
                              width: 120,
                              padding: const EdgeInsets.only(top: 0,bottom: 0, left: 0, right: 0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: AppColor.milkishgreen
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  /*new IconButton(
                                    padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    color: AppColor.green,
                                    icon: new Icon(
                                        Icons.power_settings_new,
                                        size: 30.0
                                    ),
                                    onPressed: () {
                                      print("Power click");
                                    },
                                  ),*/
                                  //new Image.asset('lib/assets/tick.png', fit: BoxFit.none),
                                  isPass ?
                                 new ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                      maxWidth: 40,
                                      maxHeight: 40,
                                    ),
                                    child: Image.asset('lib/assets/tick.png', fit: BoxFit.fill),
                                  ):
                                  SizedBox(
                                    width: 1,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    this.approvedString,
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0,
                                bottom: 0),
                            child: Container(
                              height: 90,
                              width: 20,
                              padding: const EdgeInsets.only(top: 0,bottom: 0, left: 0, right: 0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: AppColor.darkgrey
                              ),
                              child: new IconButton(
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: AppColor.white,
                                icon: new Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20.0
                                ),
                                onPressed: () {
                                  print("forward click");
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
