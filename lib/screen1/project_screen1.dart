import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:mobileproj/widget/header1.dart';

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

class ProjectScreen1 extends StatelessWidget {
  final List<Project> projects = [
    Project(
      name: "Projet gestion ressource humaine",
      image: "images/project1.jpg",
      description: "Description du projet 1. C'est un projet qui traite de la gestion des ressources humaines.",
    ),
    Project(
      name: "Projet réseau social",
      image: "images/project2.jpg",
      description: "Description du projet 2. Il s'agit d'un projet de développement d'un réseau social.",
    ),
    Project(
      name: "Projet analyse des flux de données",
      image: "images/project3.jpg",
      description: "Description du projet 3. Ce projet consiste à analyser les flux de données en temps réel.",
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
            Header1(Icon(Icons.phonelink), ' Projects'),
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
