import 'package:benz/modules/add_car_module/add_car_screen.dart';
import 'package:benz/modules/add_dismissed_module/add_dismissed_screen.dart';
import 'package:benz/modules/add_service_module/add_service_screen.dart';
import 'package:benz/modules/home_module/home_screen.dart';
import 'package:benz/modules/printing_module/printing_screen.dart';
import 'package:benz/modules/search_car_module/search_car_screen.dart';
import 'package:benz/modules/show_dismissals_module/show_dismissals_screen.dart';
import 'package:benz/modules/show_services_module/show_services_screen.dart';
import 'package:flutter/material.dart';

Color iconColor = Color(0xff57636c);
Color backGroundColor = Color(0xFFD9D9D9);
Color mainColor = Color(0xFF47C833);
Color appNameColor = Color(0xFF129c00);

List<Widget> currentScreen = [
  HomeScreen(),
  SearchCarScreen(),
  AddCarScreen(),
  AddServiceScreen(),
  AddDismissedScreen(),
  ShowServicesScreen(),
  ShowDismissalsScreen(),
  AddServiceScreen(),
];
