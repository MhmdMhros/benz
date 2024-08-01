import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class ShowDismissalsScreen extends StatelessWidget {
  const ShowDismissalsScreen({super.key});

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
        "Show Dismissals",
        style: TextStyle(
            color: appNameColor, fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}
