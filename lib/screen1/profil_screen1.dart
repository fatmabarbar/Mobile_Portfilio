import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilScreen1 extends StatelessWidget {
  final List<String> skills = [
    'Flutter', 'Java', 'Android', 'iOS', 'Ionic',
    'Dart', 'Spring', 'DEEPLEARNING', 'DEVOPS', 'Git', 'Agile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              AnimatedEngineerSymbol(),
              SizedBox(height: 20),
              Divider(color: Theme.of(context).canvasColor),
              SizedBox(height: 20),
              AnimatedContactCard(
                icon: Icons.mail,
                label: 'Email',
                value: 'fatmabarbar1@gmail.com',
                onTap: () async {
                  final url = 'mailto:fatmabarbar1@gmail.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              AnimatedContactCard(
                icon: Icons.phone,
                label: 'Phone',
                value: '+2165026606', // Ajout du préfixe pour le numéro de téléphone
                onTap: () async {
                  final phoneUrl = 'tel:+21650266061';
                  if (await canLaunch(phoneUrl)) {
                    await launch(phoneUrl);
                  } else {
                    throw 'Could not launch $phoneUrl';
                  }
                },
              ),
              AnimatedContactCard(
                icon: Icons.link,
                label: 'LinkedIn',
                value: 'https://www.linkedin.com/in/fatma-barbar-5939671a4/',
                onTap: () async {
                  final url = 'https://www.linkedin.com/in/fatma-barbar-5939671a4/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              SizedBox(height: 40),
              Text('Skills', style: TextStyle(fontSize: 25)),
              SizedBox(height: 10),
              AnimatedSkillsGrid(skills: skills),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedEngineerSymbol extends StatefulWidget {
  @override
  _AnimatedEngineerSymbolState createState() => _AnimatedEngineerSymbolState();
}

class _AnimatedEngineerSymbolState extends State<AnimatedEngineerSymbol> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotationTransition(
          turns: _controller,
          child: Icon(
            Icons.engineering,
            size: 100,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'IT ENGINEER',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AnimatedContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  AnimatedContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label),
        subtitle: GestureDetector(
          onTap: onTap,
          child: Text(value),
        ),
      ),
    );
  }
}

class AnimatedSkillsGrid extends StatelessWidget {
  final List<String> skills;

  AnimatedSkillsGrid({required this.skills});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 3,
      ),
      itemCount: skills.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedSkillChip(skill: skills[index]);
      },
    );
  }
}

class AnimatedSkillChip extends StatelessWidget {
  final String skill;

  AnimatedSkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.blue,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
