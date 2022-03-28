import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/socket_service.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_labels.dart';
import 'package:chat/widgets/boto_blau.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                CustomLogo(titol: 'Registre'),
                  
                _Form(),
                  
                CustomLabels(ruta: 'login', titol: 'Inicia sessio', subtitol: 'Ja tens compte?'),
                  
                Text('Termes i condicions de us', style: TextStyle(fontWeight: FontWeight.w200))
                
              ],
            ),
          ),
        ),
      )
    );
  }
}


class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {

  final nomCtrl   = TextEditingController(); 
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nom',
            keyboardType: TextInputType.text,
            textController: nomCtrl,
          ),

          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'e-mail',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contrasenya',
            textController: passCtrl,
            isPassword: true,
          ),
          
          BotoBlau(
            text: 'Crear compte',
            onPressed: () async {
              print( nomCtrl.text );
              print( emailCtrl.text );
              print( passCtrl.text );
              final registroOK = await authService.register(nomCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());

              if ( registroOK == true ) {
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Registro incorrecto', registroOK );
              }

            },
          )        
        ],
      ),
    );
  }
}

