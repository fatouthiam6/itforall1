import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/reservation.dart';

class DescriptionPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marché de l\'Europe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image centrale
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/descriptionrestau.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Description du restaurant
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'À propos de nous',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Le Marché de l\'Europe est un restaurant du cœur dédié à aider les personnes dans le besoin en leur offrant des repas chauds et nourrissants. Nous croyons en l\'importance de soutenir notre communauté et de partager l\'amour à travers la nourriture.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Heures d\'ouverture',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lundi - Vendredi : 11h00 - 20h00\nSamedi - Dimanche : 10h00 - 22h00',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Adresse',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '123 Rue du Marché, 75001 Paris',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nos Menus',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Petit déjeuner : Croissant, Lait, Jus d\'orange\nRepas : Quiche\nDîner : Pâtes aux Saumons',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  // Bouton de réservation pour chaque menu
                  ElevatedButton(
                    onPressed: () {
                                Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReservationPage()),
    );
                    },
                    child: Text(
                      'Réserver',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}