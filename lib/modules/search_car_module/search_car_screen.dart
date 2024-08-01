import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class SearchCarScreen extends StatelessWidget {
  const SearchCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      height: double.infinity,
      decoration: BoxDecoration(
        color: backGroundColor,
      ),
      child: Center(
          child: Text(
        "Search for a Car",
        style: TextStyle(
            color: appNameColor, fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}
