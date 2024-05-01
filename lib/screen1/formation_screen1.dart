import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobileproj/widget/header1.dart';

class FormationScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formation'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Header1(Icon(Icons.school), ' Formation '),
            SizedBox(height: 10),
            Divider(color: Theme.of(context).canvasColor),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 100 * index)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return _buildTimelineItem(context, items[index]);
                      } else {
                        return SizedBox(); // Placeholder pendant le chargement
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, TimelineItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.iconBackground,
            ),
            child: Icon(item.iconData, color: Colors.white),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.date,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(item.title),
                SizedBox(height: 5),
                Text(item.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineItem {
  final String date;
  final String title;
  final String description;
  final Color iconBackground;
  final IconData iconData;

  TimelineItem({
    required this.date,
    required this.title,
    required this.description,
    required this.iconBackground,
    required this.iconData,
  });
}

// Sample data
List<TimelineItem> items = [
  TimelineItem(
    date: '2019',
    title: 'Baccalauréat mathématique',
    description: 'Obtention du baccalauréat mathématique avec mention',
    iconBackground: Colors.green,
    iconData: Icons.school,
  ),
  TimelineItem(
    date: '2022',
    title: 'Licence en informatique de gestion',
    description: 'Obtention de la licence en informatique de gestion',
    iconBackground: Colors.redAccent,
    iconData: Icons.school,
  ),
  TimelineItem(
    date: '2025',
    title: 'Génie informatique et systèmes décisionnels',
    description: 'Obtention du diplôme en génie informatique et systèmes décisionnels',
    iconBackground: Colors.blue,
    iconData: Icons.school,
  ),
];
