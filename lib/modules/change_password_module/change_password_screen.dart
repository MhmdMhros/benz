import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/modules/login_module/login_screen.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;

  void changePassword() {
    if (_formKey.currentState!.validate()) {
// Check if the password field is empty or not
      if (_oldPasswordController.text == password) {
        DatabaseHelper dp = DatabaseHelper();
        dp
            .updateUserPassword('admin', _newPasswordController.text)
            .then((value) {
          password = _newPasswordController.text;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Change password successfully!!!')));
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginScreen()), // Replace LayoutScreen with your actual layout screen
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Old password is not correct')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width * .15,
                    MediaQuery.of(context).size.height * .27,
                    MediaQuery.of(context).size.width * .15,
                    0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _oldPasswordController,
                      decoration: InputDecoration(
                        hintText: "Old password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: mainColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: mainColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 172, 13, 2)),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, MediaQuery.of(context).size.width * .01, 0),
                          child: IconButton(
                            icon: Icon(oldPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                oldPasswordVisible = !oldPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter old password';
                        }
                        return null;
                      },
                      obscureText: oldPasswordVisible,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .04),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        hintText: "New password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: mainColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: mainColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 172, 13, 2)),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, MediaQuery.of(context).size.width * .01, 0),
                          child: IconButton(
                            icon: Icon(newPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                newPasswordVisible = !newPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                      obscureText: newPasswordVisible,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .07,
                      decoration: BoxDecoration(
                        color: appNameColor,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * .02),
                      ),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .02)),
                        onPressed: changePassword,
                        child: Text(
                          'Change password',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * .015,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
