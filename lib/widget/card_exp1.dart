import 'package:flutter/material.dart';

class CardExp1 extends StatefulWidget {
  final String title; // Titre de l'expérience
  final String description; // Description de l'expérience
  final String companyLogo; // Chemin de l'image/logo de l'entreprise

  CardExp1({
    required this.title,
    required this.description,
    required this.companyLogo,
  }); // Constructeur avec les paramètres title, description et companyLogo

  @override
  _CardExp1State createState() => _CardExp1State();
}

class _CardExp1State extends State<CardExp1> {
  bool isOpen = false;
  List<String> skills = [];

  @override
  void initState() {
    super.initState();
    _setSkills(widget.title);
  }

  void _setSkills(String title) {
    switch (title) {
      case 'Caissier chez Banque Zitouna':
        skills = [
          'Contact clientèle',
          'Communication',
          'Saisie des chèques',
          'Suivi des impayés',
          'Suivi des cartes et carnets de chèques',
          'Connaissance des produits de base de la banque (pack + service messagerie + les cartes)'
        ];
        break;
      case 'Stagiaire Technicienne chez ASM':
        skills = [
          'Laravel PHP',
          'Angular PrimeNG',
          'Gestion d\'équipe',
          'Maîtrise du stress',
          'Maîtrise de l\'oral',
          'SQL'
        ];
        break;
      case 'Stagiaire Ingénieur chez SparkIT':
        skills = [
          'Gestion du temps',
          'Spring Boot + Java',
          'JEE',
          'Angular',
          'Adaptabilité'
        ];
        break;
      case 'Stagiaire Ingénieur chez Recinov Startup':
        skills = [
          'Gestion du temps',
          'Analyse',
          'Intelligence',
          'React',
          'Node.js',
          'MongoDB',
          'NoSQL'
        ];
        break;
      default:
        skills = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.companyLogo),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getExperienceDate(widget.title),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Ingénieur développeur FullStack",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Compétences :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: isOpen ? 120 : 0, // Limite la hauteur de la section des compétences
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (String skill in skills)
                        Text(
                          '• $skill',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getExperienceDate(String title) {
    switch (title) {
      case 'Caissier chez Banque Zitouna':
        return 'Janvier 2020 - Présent';
      case 'Stagiaire Technicienne chez ASM':
        return 'Février 2022 - Présent';
      case 'Stagiaire Ingénieur chez SparkIT':
        return 'Mars 2023 - Présent';
      case 'Stagiaire Ingénieur chez Recinov Startup':
        return 'Avril 2024 - Présent';
      default:
        return '';
    }
  }
}
