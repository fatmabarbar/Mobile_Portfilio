import 'package:flutter/material.dart';

class CardFormation1 extends StatelessWidget {
  final String image;
  final String year;
  final String title;

  CardFormation1(this.image, this.year, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0), // Ajout du contour blanc
            ),
            child: ClipRRect( // Utilisation de ClipRRect pour empêcher le dépassement du contour blanc
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            year,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
