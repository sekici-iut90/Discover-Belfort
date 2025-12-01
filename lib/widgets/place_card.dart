import 'package:flutter/material.dart';
import '../models/place.dart';

// Stateless widget representing a card for a place
class PlaceCard extends StatelessWidget {
  final Place place;
  final VoidCallback onTap;

  // Required constructor with necessary parameters
  const PlaceCard({
    super.key,
    required this.place,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),

      child: ListTile(
        contentPadding: const EdgeInsets.all(18),

        // Place image with rounded corners
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            place.imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),

        // Place name
        title: Text(
          place.name,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),

        // Subtitle changes depending on whether the place has been visited
        subtitle: place.visited
            ? Text(
          "Visited",
          style: TextStyle(
            color: Colors.lightGreen[600],
            fontWeight: FontWeight.bold,
          ),
        )
            : Text(
          "Tap to discover",
          style: TextStyle(
            color: Colors.blue[600],
          ),
        ),

        // Right-side icon changes depending on whether the place has been visited
        trailing: Icon(
          place.visited ? Icons.done_all : Icons.navigate_next,
          color: place.visited ? Colors.lightGreen[600] : Colors.blue[400],
          size: 26,
        ),
        onTap: onTap,
      ),
    );
  }
}
