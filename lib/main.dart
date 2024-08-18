import 'package:benz/generated/l10n.dart';
import 'package:benz/models/user_model/user_model.dart';
import 'package:benz/modules/login_module/login_screen.dart';
import 'package:benz/shared/cache_helper.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:benz/modules/databases_module/database.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> _getPassword() async {
    DatabaseHelper dp = DatabaseHelper();
    UserModel? userModel = await dp.getUser("admin");
    return userModel?.password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String>(
        future: _getPassword(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while waiting for data
            return Container(
                color: backgroundColor,
                child: Center(
                    child: CircularProgressIndicator(
                  color: appNameColor,
                )));
          } else if (snapshot.hasError) {
            // Handle error scenario
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data is ready
            password = snapshot.data ?? '';
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
