import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
              width: MediaQuery.of(context).size.width*.75,
              height: double.infinity,
              decoration: BoxDecoration(
                color: backGroundColor,
              ),
              child: Image.asset(
                'assets/images/Front_Image-removebg-preview.png',
                
                fit: BoxFit.cover,
              ),
            );
          
  }
}