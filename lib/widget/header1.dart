import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {

final String title;
final Icon icon;
Header1(this.icon,this.title);
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).canvasColor,
          child: icon
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 27,
            color: Colors.blue, // Changer la couleur du texte en violet
          ),
        ),
      ],
    );
  }
}
