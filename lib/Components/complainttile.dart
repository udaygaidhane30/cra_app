import 'package:flutter/material.dart';

class CompTile extends StatelessWidget {
  @override
  final String textChild;
  const CompTile({super.key, required this.textChild});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.grey.shade200, boxShadow: [
              BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                    7.0, // Move to right 7.0 horizontally
                    8.0, // Move to bottom 8.0 Vertically
                  ))
            ]),
            child: Center(
              child: Text(textChild),
            ),
          ),
        ));
  }
}
