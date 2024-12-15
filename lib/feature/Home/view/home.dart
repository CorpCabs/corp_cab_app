import 'package:auto_route/auto_route.dart';
import 'package:corp_cab_app/app/common/commonTextField.dart';
import 'package:corp_cab_app/app/common/toast.dart';
import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/app/validators/text_field_validator.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:corp_cab_app/core/utils/logger/logger_utils.dart';
import 'package:corp_cab_app/feature/ScaffoldWithNavbar/components/vehicleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "GOOD DAY,\nSiffat",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SvgPicture.asset(
                  'assets/images/Home.svg', // Add your image asset here
                  height: MediaQueryExtension(context).veryhighValue2x,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle find a ride
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Book a ride now",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Schedule for Later",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

