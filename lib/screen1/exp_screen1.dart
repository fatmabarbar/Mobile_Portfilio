import 'package:flutter/material.dart';
import 'package:mobileproj/widget/card_exp1.dart';
import 'package:mobileproj/widget/header1.dart';

class ExpScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Header1(Icon(Icons.update), 'Expériences'),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext ctx, int index) {
                return CardExp1(
                  title: _expData[index]['title']!, // Utilisez le titre de l'expérience à partir de _expData
                  description: _expData[index]['description']!, // Utilisez la description de l'expérience à partir de _expData
                  companyLogo: _expData[index]['logo']!, // Utilisez le chemin de l'image/logo de l'entreprise à partir de _expData
                );
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return SizedBox(height: 15);
              },
              itemCount: _expData.length, // Utilisez la longueur de _expData pour obtenir le nombre d'expériences
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> _expData = [
  {
    'title': 'Caissier chez Banque Zitouna',
    'company': 'Banque Zitouna',
    'description':
    'Travail en tant que caissier, gestion des opérations de caisse et service client.',
    'logo': 'images/Zitouna.jpg', // Add image path for the company logo
  },
  {
    'title': 'Stagiaire Technicienne chez ASM',
    'company': 'ASM',
    'description':
    'Stage en tant que technicienne, travaillant sur les technologies Laravel, Angular et SQL.',
    'logo': 'images/asm.jpg', // Add image path for the company logo
  },
  {
    'title': 'Stagiaire Ingénieur chez SparkIT',
    'company': 'SparkIT',
    'description':
    'Stage en tant qu\'ingénieur, travaillant sur les technologies Spring Boot, Angular et SQL.',
    'logo': 'images/sparkit.jpg', // Add image path for the company logo
  },
  {
    'title': 'Stagiaire Ingénieur chez Recinov Startup',
    'company': 'Recinov Startup',
    'description':
    'Stage en tant qu\'ingénieur, travaillant sur l\'analyse, l\'intelligence artificielle, Python, React et Node.js.',
    'logo': 'images/recinov.png', // Add image path for the company logo
  },
];
