import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/widgets/customtext.dart';
import 'package:http/http.dart' as http;

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();


 
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime? _selectedDate;
  String? _selectedMeal;
  String? _selectedRestaurant; // Nouvel attribut pour stocker le restaurant sélectionné
  String? _reservationMessage;
   void reservation(String nom, String prenom, String telephone, String email, String date, String repas, String restaurant) async {
  final response = await http.post(
    Uri.parse('https://soldeat.000webhostapp.com/solideat/reservation.php'),
    body: {
      'nom': nom,
      'prenom': prenom,
      'telephone': telephone,
      'email': email,
      'date': date,
      'repas': repas,
      'restaurant': restaurant,
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    if (data['success'] != null && data['success'] is bool && data['success']) {
      setState(() {
        _reservationMessage = "Réservation réussie !"; // Mettre à jour le message de réservation
      });
    } else if (data['msg'] != null) {
      setState(() {
        _reservationMessage = data['msg']; // Mettre à jour le message de réservation
      });
    }
  }
}

  
  final _key = GlobalKey<FormState>();
  CustomTextField nomText = CustomTextField(
    title: "nom",
    placeholder: "Enter nom",
    fontSize: 0,
  );
  CustomTextField prenomText = CustomTextField(
    title: "prenom",
    placeholder: "Enter prenom",
    fontSize: 0,
  );
  CustomTextField telephoneText = CustomTextField(
    title: "telephone",
    placeholder: "Enter telephone",
    fontSize: 0,
  );
  CustomTextField emailText = CustomTextField(
    title: "email",
    placeholder: "Enter email",
    fontSize: 0,
  );

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
        Builder(
          builder: (context) => Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Titre "SolidEat"
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
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
                // Message de réservation
                if (_reservationMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      _reservationMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                // Formulaire d'inscription
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
                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != _selectedDate) {
                            setState(() {
                              _selectedDate = picked;
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: _selectedDate != null
                                  ? _selectedDate.toString()
                                  : '',
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Dropdown pour le choix de repas
                      DropdownButtonFormField<String>(
                        value: _selectedMeal,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMeal = newValue;
                          });
                        },
                        items: <String>[
                          'Petit déjeuner',
                          'Déjeuner',
                          'Dîner'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Choix de repas',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Dropdown pour le choix du restaurant
                      DropdownButtonFormField<String>(
                        value: _selectedRestaurant,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedRestaurant = newValue;
                          });
                        },
                        items: <String>[
                          'Chanzy',
                          'Joseph de Maistre',
                          'Marche de l\'Europe ',
                          'Vellefaux',
                          'Restaurant 5'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Choix du restaurant',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 100),
                      ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            // Appeler la méthode de réservation avec les données du formulaire
                            reservation(
                              nomText.controller.text,
                              prenomText.controller.text,
                              telephoneText.controller.text,
                              emailText.controller.text,
                              _selectedDate.toString(),
                              _selectedMeal!,
                              _selectedRestaurant!, // Inclure le restaurant sélectionné
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(157, 255, 197, 197),
                        ),
                        child: const Text(
                          'Valider',
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
                          const Text(
                            ' ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              '',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
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

