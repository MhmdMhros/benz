import 'package:benz/modules/home_module/home_screen.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  
  List<Widget> currentScreen=[

    HomeScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
     int currentIndexScreen=0;

    return Scaffold(
     
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*.25,
              height: double.infinity,
              decoration: BoxDecoration(
                color: backGroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: backGroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 30, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/images/Logo-removebg-preview.png',
                              width: MediaQuery.of(context).size.width*.06,
                              height: MediaQuery.of(context).size.height*0.13,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Car Benz',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w500,
                              color: appNameColor,
                              fontSize: MediaQuery.of(context).size.width*.03,
                              letterSpacing: 0,
                            ),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
                        height: MediaQuery.of(context).size.height*.03,
                       ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
                        height: MediaQuery.of(context).size.height*.03,
                       ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
                        height: MediaQuery.of(context).size.height*.03,
                       ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
                        height: MediaQuery.of(context).size.height*.03,
                       ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
                        height: MediaQuery.of(context).size.height*.03,
                       ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width*.015, 0, 0, 0),
                          child: Container(
                             height: MediaQuery.of(context).size.height*.08,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width*.02
                              ),
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*.02)),
                              onPressed: (){},
                              child: Padding(
                                padding:   EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width*.02
                                  , 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.width*.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          MediaQuery.of(context).size.width*.015, 0, 0, 0),
                                      child: Text(
                                        'Search for a Car',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width*.02,
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
           HomeScreen(),
          ],
        ),
      ),
    );
  }
}
