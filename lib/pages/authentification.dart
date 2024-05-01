import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController txt_login = TextEditingController();
TextEditingController txt_password = TextEditingController();

class Authentification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification Page"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "login",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 5),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txt_password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 5),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _onAuthenticate(context);
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/inscription');
            },
            child: Text("Create an account"),
          ),
        ],
      ),
    );
  }
}

void _onAuthenticate(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String log = prefs.getString("login") ?? '';
  String psw = prefs.getString("password") ?? '';

  if (txt_login.text == log && txt_password.text == psw) {
    prefs.setBool("connecte", true);
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invalid ID or password'),
      ),
    );
  }
}
