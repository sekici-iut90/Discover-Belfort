import 'package:flutter/material.dart';
import '../models/place.dart';

class DetailPage extends StatelessWidget {
  final Place place;          // Selected place
  final VoidCallback onVisited;

  const DetailPage({
    super.key,
    required this.place,
    required this.onVisited,
  });

  // Definition of the colors used for the blue theme
  static const Color primaryBlue = Color(0xFF1565C0);
  static const Color accentBlue = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App bar with the name of the place and a back button
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // Retour à la liste
        ),
        backgroundColor: primaryBlue,
        elevation: 0,

        // Rounded shape at the bottom of the AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),

        title: Text(
          place.name, // Display the name of the place in title
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,

        // Small icon on the right
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.info_outline, color: Colors.white, size: 24),
          )
        ],
      ),

      // Main page content
      body: Padding(
        padding: const EdgeInsets.all(16),

        // Vertical organization of content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Map displaying the image of the place
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  place.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Name of the place displayed in large title
            Text(
              place.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 10),

            // Small decorative bar under the title
            Divider(
              color: accentBlue,
              thickness: 3,
              indent: 0,
              endIndent: MediaQuery.of(context).size.width * 0.4,
            ),

            const SizedBox(height: 16),

            // Description of the place
            Text(
              place.description,
              style: const TextStyle(
                fontSize: 17,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 50),

            // Button to mark the place as visited
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: accentBlue,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onPressed: () {
                // Temporary message at the bottom of the screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Place marked as visited!"),
                    backgroundColor: primaryBlue,
                    duration: const Duration(seconds: 1),
                  ),
                );

                onVisited();        // Mark the place as visited
                Navigator.pop(context); // Return to the list
              },

              icon: const Icon(Icons.location_history, color: Colors.white),
              label: const Text("Mark as visited"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
