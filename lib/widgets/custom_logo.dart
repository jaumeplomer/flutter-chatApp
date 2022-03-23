import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {

  final String titol;

  const CustomLogo({
    Key? key, 
    required this.titol
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only( top: 50),
        child: Column(
          children: <Widget>[

            Image(image: AssetImage('assets/tag-logo.png') ),
            SizedBox( height: 20),
            Text(this.titol, style: TextStyle(fontSize: 30))

          ],
        ),
      ),
    );
  }
}