import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/deuxiemepage.dart';
import 'package:solideat_projet/screens/login.dart';

class PremierePageEntree extends StatelessWidget {
  const PremierePageEntree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height, // Définir une hauteur égale à la hauteur de l'écran
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/as4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 300,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeuxiemePage()),
                    );
                  },
                  child: Text(
                    'SolidEat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(178, 230, 137, 180),
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
