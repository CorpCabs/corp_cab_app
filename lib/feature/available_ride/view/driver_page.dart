import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DriverListPage extends StatelessWidget {
  const DriverListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Available rides',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          rideCard(
            context: context,
            name: "WASEEM JAVED",
            rating: 4.8,
            dateTime: "Dec 15, 2024 | 3:40 PM",
            startLocation: "Electronic City, Bengaluru",
            endLocation: "M.G. Road, Bengaluru",
            vehicleModel: "Sedan",
            fare: "₹ 234",
            driverImage: "assets/images/profile.svg", // Replace with your image path
          ),
          const SizedBox(height: 12),
          rideCard(
            context: context,
            name: "JAVED WASEEM",
            rating: 4.8,
            dateTime: "Dec 15, 2024 | 3:50 PM",
            startLocation: "Electronic City, Bengaluru",
            endLocation: "M.G. Road, Bengaluru",
            vehicleModel: "Swift Dzire",
            fare: "₹ 234",
            driverImage: "assets/images/profile.svg", // Replace with your image path
          ),
        ],
      ),
    );
  }

  Widget rideCard({
    required BuildContext context,
    required String name,
    required double rating,
    required String dateTime,
    required String startLocation,
    required String endLocation,
    required String vehicleModel,
    required String fare,
    required String driverImage,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(driverImage), // Profile picture
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(
                        " ($rating)",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            dateTime,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.radio_button_checked, color: Colors.green, size: 18),
              const SizedBox(width: 4),
              Text(startLocation, style: const TextStyle(fontSize: 13)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
            child: SizedBox(
              height: 12,
              child: VerticalDivider(color: Colors.grey, thickness: 2),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black, size: 18),
              const SizedBox(width: 4),
              Text(endLocation, style: const TextStyle(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Vehicle Model",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    vehicleModel,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     const Text(
              //       "Ride Fare",
              //       style: TextStyle(color: Colors.grey),
              //     ),
              //     Text(
              //       fare,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                context.go('/home/booking-confirm');
              },
              child: const Text(
                "Request",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
