import 'package:flutter/material.dart';

class RideDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Ride details',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Driver Section
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.svg'),
              ),
              title: Text(
                'WASEEM JAVED',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SWIFT DZIRE Model 2022'),
                  SizedBox(height: 2),
                  Text(
                    'GJ 07 06F 5597',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
            Divider(),

            // Locations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Electronic City, Bengaluru',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star_border, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'M.G. Road, Bengaluru',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Time of Arrival
            SizedBox(height: 30),
            Text(
              'Time of Arrival',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              '03 : 40 PM',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.5),
            ),

            // Vehicle Image
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'VEHICLE',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/images/car.png', // Replace with your vehicle image asset
                    height: 120,
                  ),
                ],
              ),
            ),

            // Call & Message Buttons
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      // Call Driver logic
                    },
                    child: Text(
                      'Call Driver',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      // Message Driver logic
                    },
                    child: Text(
                      'Message Driver',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
