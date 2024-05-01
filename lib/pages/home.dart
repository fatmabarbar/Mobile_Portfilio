import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription Page"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          Center(
              child: Text(
                "Inscription body",
                style: TextStyle(fontSize: 33, color: Colors.indigo),
              )),
          ElevatedButton(
              onPressed: () {
                _onSignOut(context);
              },
              child: Text("Sign Out"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ))
        ],
      ),
    );
  }

  Future<void> _onSignOut(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connected", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}

  // Fonction pour gérer le bouton de déconnexion
  Future<void> _onDeconnexionPressed(BuildContext context) async {
    // Code de déconnexion ici (par exemple, suppression des informations de connexion)
    // Vous pouvez ici supprimer les données d'identification stockées ou effectuer d'autres actions nécessaires

    // Navigation vers la page d'authentification et suppression des routes précédentes
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/authentification', // Route de la page d'authentification
          (route) => false, // Supprimer toutes les routes précédentes
    );
  }


