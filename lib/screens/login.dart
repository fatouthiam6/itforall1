
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/accueil.dart';
import 'package:solideat_projet/screens/inscription.dart';
import 'package:solideat_projet/widgets/customtext.dart';
import 'package:http/http.dart' as http;
// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  
    const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  String err="";
  void login(String email, String password) async{
    setState((){
      err ="";
    });
final response = await http.post(
  Uri.parse('https://soldeat.000webhostapp.com/solideat/login.php'),
  body: {
    "email": email,
   "password": password

  }
);


if (response.statusCode == 200) {
  var data = jsonDecode(response.body);
  print(data);
  if (data != null && data.containsKey('success')) {
    var success = data['success'];
    if (success != null && success == 1) {
      setState(() {
        err = data['msg'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => accueilPage()),
      );
    } else {
      setState(() {
        err = data['msg'] ?? "Une erreur s'est produite";
      });
    }
  } else {
    setState(() {
      err = "Format de données invalide";
    });
  }
} else {
  setState(() {
    err = "Échec de la connexion au serveur";
  });
}




  }
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter email", fontSize: 0,
  );
  CustomTextField passText = new CustomTextField(
      title: "Password", placeholder: "***********", ispass: true, fontSize: 0);

 @override
Widget build(BuildContext context) {
  emailText.err = "enter email";
  passText.err = "enter password";
  return Scaffold(
    body: SingleChildScrollView(
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/fond2.jpg',
              fit: BoxFit.fill,
            ),
          ),
          // Contenu de la page
          Padding(
            padding: const EdgeInsets.only(top: 200.0), // Ajoutez un padding en haut de 100.0
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Titre "SolidEat"
                  const Text(
                    'SolidEat',
                    style: TextStyle(
                      fontFamily: 'DancingScript-Bold',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 20,), // Ajoutez un espace entre le titre et le formulaire
                  // Formulaire de connexion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        // Champ Email
                        emailText.textfrofield(),
                        SizedBox(
                          height: 10,
                        ),
                        passText.textfrofield(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          err,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ), // Affichez le message d'erreur centré
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              login(emailText.value, passText.value);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(157, 255, 197, 197),
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Pas encore membre ? ',
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InscriptionPage()),
                                );
                              },
                              child: const Text(
                                'Inscrivez-vous',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}