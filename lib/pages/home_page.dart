import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_card.dart';
import 'detail_page.dart';
import '../data/places_data.dart';

// Main page showing the list of places in Belfort
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of available places, retrieved from places_data.dart
  List<Place> places = placesData;

  // Mark a place as visited
  void markVisited(int index) {
    setState(() {
      places[index].visited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light blue color applied to the background of the page
      backgroundColor: Colors.blue[50],

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,

        // Gives a rounding at the bottom of the app bar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),

        title: const Text(
          "Discover Belfort",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        centerTitle: true,

        // Icon displayed to the right of the app bar
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.map,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        // Dynamic list displaying each place via a PlaceCard widget
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return PlaceCard(
              place: places[index],
              onTap: () async {
                // Navigation to the details page
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      place: places[index],
                      onVisited: () => markVisited(index),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
