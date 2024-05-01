import 'package:flutter/material.dart';

class CardExp extends StatefulWidget {
  final String title; // Titre de l'expérience
  final String description; // Description de l'expérience
  final String companyLogo; // Logo de l'entreprise

  CardExp({
    required this.title,
    required this.description,
    required this.companyLogo,
  });

  @override
  _CardExpState createState() => _CardExpState();
}

class _CardExpState extends State<CardExp> {
  bool isOpen = false;
  List<String> skills = [];

  @override
  void initState() {
    super.initState();
    _setSkills(widget.title);
  }

  void _setSkills(String title) {
    switch (title) {
      case 'Clinisys':
        skills = [
          'Intelligence artificielle',
          'Business Intelligence (BI)',
          'Développement Laravel',
          'Développement Odoo',
        ];
        break;
      case 'ASM':
        skills = [
          'Laravel PHP',
          'Angular PrimeNG',
          'Gestion d\'équipe',
          'Maîtrise du stress',
          'Maîtrise de l\'oral',
          'SQL'
        ];
        break;
      case 'Jagura':
        skills = [
          'Connaissance en développement',
          'Intelligence artificielle',
          'Business Intelligence (BI)',
        ];
        break;
      case 'Rec-inov':
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
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isOpen ? 100 : 0,
                curve: Curves.easeInOut,
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
      case 'Clinisys':
        return 'Janvier 2020 - Présent';
      case 'ASM':
        return 'Février 2022 - Présent';
      case 'Jagura':
        return 'Mars 2023 - Présent';
      case 'Rec-inov':
        return 'Avril 2024 - Présent';
      default:
        return '';
    }
  }
}
