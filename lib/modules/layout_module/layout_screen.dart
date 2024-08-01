import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndexScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .25,
              height: double.infinity,
              decoration: BoxDecoration(
                color: backGroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .19,
                    decoration: BoxDecoration(
                      color: backGroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              MediaQuery.of(context).size.width * .02,
                              0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.aspectRatio * 0.05),
                            child: Image.asset(
                              'assets/images/Logo-removebg-preview.png',
                              width: MediaQuery.of(context).size.width * .06,
                              height: MediaQuery.of(context).size.height * 0.13,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          'Car Benz',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.w500,
                            color: appNameColor,
                            fontSize: MediaQuery.of(context).size.width * .035,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 1;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width *
                                          .04,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .01,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 2;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      width: MediaQuery.of(context).size.width*.05,
                                       height: MediaQuery.of(context).size.height*.06,
                                      "assets/icons/add_car.png",
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Add Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 3;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      width: MediaQuery.of(context).size.width*.05,
                                       height: MediaQuery.of(context).size.height*.06,
                                      "assets/icons/add_service.png",
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Add Service',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 4;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      width: MediaQuery.of(context).size.width*.05,
                                       height: MediaQuery.of(context).size.height*.06,
                                      "assets/icons/add_dismissed.png",
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Add Dismissed',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 5;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      width: MediaQuery.of(context).size.width*.05,
                                       height: MediaQuery.of(context).size.height*.06,
                                      "assets/icons/show_services.png",
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Show Services',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 6;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      width: MediaQuery.of(context).size.width*.05,
                                       height: MediaQuery.of(context).size.height*.06,
                                      "assets/icons/show_dismissals.png",
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Show Dismissals',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * .015,
                              0,
                              0,
                              0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .02),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * .02)),
                              onPressed: () {
                                setState(() {
                                  currentIndexScreen = 0;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    MediaQuery.of(context).size.width * .02,
                                    0,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.exit_to_app,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width *
                                          .03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width *
                                              .015,
                                          0,
                                          0,
                                          0),
                                      child: Text(
                                        'Exit',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            currentScreen[currentIndexScreen],
          ],
        ),
      ),
    );
  }
}
