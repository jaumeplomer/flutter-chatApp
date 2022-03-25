import 'package:chat/widgets/boto_blau.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

import 'package:chat/helpers/mostrar_alerta.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_labels.dart';


class LoginPage extends StatelessWidget {

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
                
                CustomLogo(titol: 'Messenger'),
                  
                _Form(),
                  
                CustomLabels(ruta: 'register', titol: 'Crea un compte ara!', subtitol: 'No tens compte?'),
                  
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

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context );

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[

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
            text: 'Ingrese',
            onPressed: () async {
              
              FocusScope.of(context).unfocus();

              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if ( loginOk ) {
                //TODO: conectar al socketServer
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Login incorrecte', 'Credencials no coinciden');

              }

            },
          )        
        ],
      ),
    );
  }
}

