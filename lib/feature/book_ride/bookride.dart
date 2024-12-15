import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookRidePage extends StatelessWidget {
  const BookRidePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final cabProvider = Provider.of<CabBookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            context.pop(); // Close the page
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Find a ride',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100], // Light background color
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Search Pickup
            TextField(
              onChanged: cabProvider.setPickupLocation,
              decoration: InputDecoration(
                hintText: 'Search Pickup',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Search Destination
            TextField(
              onChanged: cabProvider.setDropOffLocation,
              decoration: InputDecoration(
                hintText: 'Search Destination',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Saved Places Bar
            const Text(
              'Saved Places',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      cabProvider.setPickupLocation('Home');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.home, color: Colors.grey[700], size: 30),
                        const SizedBox(height: 5),
                        const Text(
                          'Home',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey[300], // Divider between Home and Work
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      cabProvider.setPickupLocation('Work');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.work, color: Colors.grey[700], size: 30),
                        const SizedBox(height: 5),
                        const Text(
                          'Work',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Search Button
            ElevatedButton(
              onPressed: () {
                // Handle search action
                debugPrint(
                  'Searching for a ride from ${cabProvider.pickupLocation} to ${cabProvider.dropOffLocation}',
                );
                context.pushNamed('select-car');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Search a ride',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}