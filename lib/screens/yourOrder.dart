import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String address;
  final String dateVisited;

  Restaurant({
    required this.name,
    required this.address,
    required this.dateVisited,
  });
}

class HistoryPage extends StatelessWidget {
  final List<Restaurant> visitedRestaurants = [
    Restaurant(
      name: 'Marche de l\'Europe',
      address: '123 Rue du Marche, 75001 Paris',
      dateVisited: '01/04/2024',
    ),
    Restaurant(
      name: 'Vellefaux',
      address: '66 Avenue Claude VelleFaux',
      dateVisited: '25/03/2024',
    ),
    Restaurant(
      name: 'Chanzy',
      address: '6 Rue de Chanazy',
      dateVisited: '12/03/2024',
    ),
    Restaurant(
      name: 'Joseph de Maistre',
      address: 'Rue Joseph Maistre, 75018 Paris',
      dateVisited: '05/03/2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique'),
        backgroundColor:const Color.fromARGB(178, 230, 137, 180),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fond2.jpg'), // Ajoutez votre image de fond ici
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: visitedRestaurants.length,
          itemBuilder: (context, index) {
            final restaurant = visitedRestaurants[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7), // Opacité pour un look plus esthétique
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    restaurant.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.address),
                      Text(restaurant.dateVisited),
                    ],
                  ),
                  onTap: () {
                    // Action lorsque l'utilisateur appuie sur un restaurant dans l'historique
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

