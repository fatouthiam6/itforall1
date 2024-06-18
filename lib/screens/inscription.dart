import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/accueil.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/restaurant.dart';
import 'package:solideat_projet/widgets/customtext.dart';
import 'package:http/http.dart' as http;

class InscriptionPage extends StatefulWidget {
  InscriptionPage({Key? key}) : super(key: key);

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _key = GlobalKey<FormState>();

  String? _errorText;

  void inscription(String nom, String prenom, String telephone, String email, String password, BuildContext context) async {
    if (!isPasswordSecure(password)) {
      setState(() {
        _errorText = "Le mot de passe doit contenir au moins 12 caractères avec une majuscule et une minuscule.";
      });
      return;
    }

    final response = await http.post(
      Uri.parse('https://soldeat.000webhostapp.com/solideat/inscription.php'),
      body: {
        'nom': nom,
        'prenom': prenom,
        'telephone': telephone,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      // Vous pouvez également gérer la réponse du serveur ici

      // Si l'inscription est réussie, naviguer vers la page d'accueil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  bool isPasswordSecure(String password) {
    // Vérifier la longueur minimale
    if (password.length < 12) {
      return false;
    }

    // Vérifier s'il y a au moins une lettre majuscule et une lettre minuscule
    bool hasUpperCase = false;
    bool hasLowerCase = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i] == password[i].toUpperCase()) {
        hasUpperCase = true;
      }
      if (password[i] == password[i].toLowerCase()) {
        hasLowerCase = true;
      }
    }

    return hasUpperCase && hasLowerCase;
  }

  final nomText = CustomTextField(
    title: "Nom",
    placeholder: "Entrez votre nom",
    fontSize: 0,
  );

  final prenomText = CustomTextField(
    title: "Prénom",
    placeholder: "Entrez votre prénom",
    fontSize: 0,
  );

  final telephoneText = CustomTextField(
    title: "Téléphone",
    placeholder: "Entrez votre numéro de téléphone",
    fontSize: 0,
  );

  final emailText = CustomTextField(
    title: "Email",
    placeholder: "Entrez votre adresse email",
    fontSize: 0,
  );

  final passText = CustomTextField(
    title: "Mot de passe",
    placeholder: "***********",
    ispass: true,
    fontSize: 0,
  );

  final confirmPassText = CustomTextField(
    title: "Confirmez le mot de passe",
    placeholder: "***********",
    ispass: true,
    fontSize: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/fond2.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Text(
                          'SolidEat',
                          style: TextStyle(
                            fontFamily: 'DancingScript-Bold',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        if (_errorText != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              _errorText!,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        nomText.textfrofield(),
                        SizedBox(height: 10),
                        prenomText.textfrofield(),
                        SizedBox(height: 10),
                        telephoneText.textfrofield(),
                        SizedBox(height: 10),
                        emailText.textfrofield(),
                        SizedBox(height: 10),
                        passText.textfrofield(),
                        SizedBox(height: 10),
                        confirmPassText.textfrofield(),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _errorText = null;
                            });
                            if (_key.currentState!.validate()) {
                              if (passText.value == confirmPassText.value) {
                                inscription(
                                  nomText.value,
                                  prenomText.value,
                                  telephoneText.value,
                                  emailText.value,
                                  passText.value,
                                  context, // Passer le contexte à la fonction d'inscription
                                );
                              } else {
                                setState(() {
                                  _errorText = "Les mots de passe sont différents";
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(157, 255, 197, 197),
                          ),
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Vous êtes déjà membre ? ',
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(
                                'Connectez-vous',
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
          ],
        ),
      ),
    );
  }
}
