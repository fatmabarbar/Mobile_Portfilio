import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Function(int) onProfileTapped;
  final Function switchTheme; // Ajouter le paramètre switchTheme

  SplashScreen({
    required this.onProfileTapped,
    required this.switchTheme,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.onProfileTapped(0);
                widget.switchTheme(); // Appeler switchTheme lors du tap sur le profil 0
              },
              child: _buildProfileImage(0),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                widget.onProfileTapped(1);
                widget.switchTheme(); // Appeler switchTheme lors du tap sur le profil 1
              },
              child: _buildProfileImage(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(int index) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = -1;
        });
      },
      child: Container(
        width: 160,
        height: 160,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(index == 0 ? 'images/amira.jpg' : 'images/me.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: _hoveredIndex == index
                        ? [Colors.purple.withOpacity(0.3), Colors.transparent]
                        : [Colors.transparent, Colors.transparent],
                    stops: [0.8, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
