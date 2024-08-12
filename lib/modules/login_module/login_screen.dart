import 'package:benz/modules/change_password_module/change_password_screen.dart';
import 'package:benz/modules/layout_module/layout_screen.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // Constructor with named parameters
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

  void loginAsAdmin() {
    if (_formKey.currentState!.validate()) {
      print(password);
// Check if the password field is empty or not
      if (_passwordController.text == password) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login as an admin successfully!!!')));
        isAdmin = true;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LayoutScreen(
                    isAdmin: true,
                  )), // Replace LayoutScreen with your actual layout screen
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password is not correct')));
      }
    }
  }

  void loginAsUser() {
    // Navigate to layout screen without any checks
    // Replace `LayoutScreen` with your actual layout screen
    isAdmin = false;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LayoutScreen(
                isAdmin: false,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MediaQuery.of(context).size.height * .3,
                MediaQuery.of(context).size.width * .15,
                0),
            child: Column(
              children: [
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Password for admin only",
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
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 0, MediaQuery.of(context).size.width * .01, 0),
                      child: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: passwordVisible,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width * .55,
                      MediaQuery.of(context).size.height * .01,
                      0,
                      0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .15,
                    height: MediaQuery.of(context).size.height * .05,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangePasswordScreen()), // Replace LayoutScreen with your actual layout screen
                        );
                      },
                      child: Text(
                        'Forget Password!',
                        style: TextStyle(color: appNameColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        onPressed: loginAsAdmin,
                        child: Text(
                          'Login as an admin',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * .015,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
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
                        onPressed: loginAsUser,
                        child: Text(
                          'Login as a user',
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
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
