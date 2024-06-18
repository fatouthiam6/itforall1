import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/inscription.dart';
import 'package:solideat_projet/screens/inscritptionAdmin.dart';
import 'package:solideat_projet/screens/login.dart';

class DeuxiemePage extends StatelessWidget {
  const DeuxiemePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/fond2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Contenu de la page
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image en border radius
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logosoildeat.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200.0,
                  ),
                  const SizedBox(height: 20.0),
                  // Texte "SolidEat"
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'SolidEat',
                      style: TextStyle(
                        fontFamily: 'DancingScript-Bold',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Partie gauche pour les utilisateurs
                  Column(
                    children: [
                      Text(
                        "Connectez-vous ou inscrivez-vous si vous êtes un utilisateur",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InscriptionPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(178, 230, 137, 180),
                        ),
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(178, 230, 137, 180),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // Partie droite pour les administrateurs
                  Column(
                    children: [
                      Text(
                        "Connectez-vous ou inscrivez-vous si vous êtes un administrateur",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InscriptionAdmin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(178, 230, 137, 180),
                        ),
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(178, 230, 137, 180),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
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
