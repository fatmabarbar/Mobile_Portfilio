import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Inscription Page"),
            backgroundColor: Colors.indigoAccent),
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
                        borderSide: BorderSide(width: 5))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: txt_pass,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _onInscrire(context);
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/authentification');
                },
                child: Text("Already a member?"))
          ],
        ));
  }

  void _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();

    if (!txt_login.text.isEmpty && !txt_pass.text.isEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_pass.text);
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(
        content: Text('Id Ou mot de passe vides'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

