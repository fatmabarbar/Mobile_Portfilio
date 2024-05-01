import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileproj/screen/exp_screen.dart';
import 'package:mobileproj/screen/formation_screen.dart';
import 'package:mobileproj/screen/profil_screen.dart';
import 'package:mobileproj/screen/project_screen.dart';

class TabBarScreen extends StatefulWidget {
  final Function switchTheme; // Add switchTheme parameter

  TabBarScreen({required this.switchTheme});

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  var _indexPages = 0;

  List<Widget> pages = [
    ProfilScreen(),
    ExpScreen(),
    FormationScreen(),
    ProjectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CV ',
          style: TextStyle(color: Colors.black), // Change app bar text color to black
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_color_fill),
            onPressed: () {
              widget.switchTheme(); // Call switchTheme function when the button is pressed
            },
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black, // Change icon color to black
          ),
          Icon(
            Icons.update,
            size: 30,
            color: Colors.black, // Change icon color to black
          ),
          Icon(
            Icons.school,
            size: 30,
            color: Colors.black, // Change icon color to black
          ),
          Icon(
            Icons.phonelink,
            size: 30,
            color: Colors.black, // Change icon color to black
          )
        ],
        onTap: (index) {
          setState(() {
            _indexPages = index;
          });
        },
      ),
      body: pages[_indexPages],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNormalTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV',
      theme: isNormalTheme
          ? ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        canvasColor: Colors.black87,
        cardColor: Color(0xFFf2f2f2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
          : ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF313133)),
        backgroundColor: Colors.black87,
        canvasColor: Colors.white,
        cardColor: Colors.black12,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabBarScreen(switchTheme: switchTheme), // Pass switchTheme function to TabBarScreen
    );
  }

  void switchTheme() {
    setState(() {
      isNormalTheme = !isNormalTheme;
    });
  }

  MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
