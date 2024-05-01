import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:mobileproj/widget/header.dart';

class Project {
  final String name;
  final String image;
  final String description;

  Project({
    required this.name,
    required this.image,
    required this.description,
  });
}

class ProjectScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      name: "Projet analyse des flux de données des candidats",
      image: "images/project3.jpg",
      description: "Description du projet 4. Ce projet consiste à analyser les flux de données des candidats en temps réel.",
    ),
    Project(
      name: "Projet CE",
      image: "images/project5.jpg",
      description: "Description du projet 5. Il s'agit d'un projet pour le Comité d'Entreprise.",
    ),
    Project(
      name: "Projet intelligence artificielle",
      image: "images/project6.jpg",
      description: "Description du projet 6. Un projet qui met en œuvre des techniques d'intelligence artificielle.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Header(Icon(Icons.phonelink), ' Projects'),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Theme.of(context).canvasColor,
            ),
            Expanded(
              child: Swiper(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildProjectCard(context, projects[index]);
                },
                pagination: SwiperPagination(), // Ajoute une pagination
                control: SwiperControl(), // Ajoute des contrôles de navigation
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              project.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  project.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  project.description,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
