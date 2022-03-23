import 'package:flutter/material.dart';

class CustomLabels extends StatelessWidget {

  final String ruta;
  final String titol;
  final String subtitol;

  const CustomLabels({
    Key? key, 
    required this.ruta,
    required this.titol,
    required this.subtitol
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.subtitol, style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          SizedBox( height: 10),
          GestureDetector(
            child: Text(this.titol, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold) ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          )
        ],
      ),
    );
  }
}