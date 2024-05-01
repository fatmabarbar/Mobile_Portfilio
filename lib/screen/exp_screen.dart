import 'package:flutter/material.dart';
import 'package:mobileproj/widget/card_exp.dart';
import 'package:mobileproj/widget/header.dart';

class ExpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Header(Icon(Icons.update), 'Expériences'),
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
                return CardExp(
                  title: _expData[index]['title']!,
                  description: _expData[index]['description']!,
                  companyLogo: _expData[index]['logo']!, // Add company logo
                );
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return SizedBox(height: 15);
              },
              itemCount: _expData.length,
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> _expData = [
  {
    'title': 'Clinisys',
    'company': 'Clinisys',
    'description': 'Description de l\'expérience chez Clinisys',
    'logo': 'images/clinisys.png', // Add image path for the company logo
  },
  {
    'title': 'ASM',
    'company': 'ASM',
    'description': 'Description de l\'expérience chez ASM',
    'logo': 'images/asm.jpg', // Add image path for the company logo
  },
  {
    'title': 'Technopole Sfax',
    'company': 'Technopole Sfax',
    'description': 'Description de l\'expérience chez Jagura',
    'logo': 'images/technopole.png', // Add image path for the company logo
  },
  {
    'title': 'Rec-inov',
    'company': 'Rec-inov',
    'description': 'Description de l\'expérience chez Rec-inov',
    'logo': 'images/recinov.png', // Add image path for the company logo
  },
];
