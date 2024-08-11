import 'package:benz/modules/databases_module/database.dart';
import 'package:benz/modules/layout_module/layout_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();
  

  void _login() async {
    final user = await _dbHelper.getUser(_userNameController.text);
    if (user != null && user.password == _passwordController.text) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LayoutScreen()),
        );
      
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successfully')));
        // Navigate to th
        } else {
      // Show login failed message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            IconButton(
              icon: Icon(Icons.login),
              onPressed: _login,
            ),
          ],
        ),
      );
    
  }
}