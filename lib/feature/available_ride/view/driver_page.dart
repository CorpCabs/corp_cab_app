import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/feature/available_ride/components/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DriverListPage extends StatefulWidget {
  const DriverListPage({super.key});

  @override
  State<DriverListPage> createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CabBookingProvider>(context, listen: false).fetchDrivers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          'Available Rides',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CabBookingProvider>(
        builder: (context, providerItem, child) {
          if (providerItem.isFetchingDrivers) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (providerItem.hasDriverFetchError) {
            return const Center(
              child: Text(
                'Failed to fetch drivers. Please try again.',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (providerItem.drivers.isEmpty) {
            return const Center(
              child: Text('No Drivers are available'),
            );
          }

          return ListView.builder(
            itemCount: providerItem.drivers.length,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemBuilder: (context, index) {
              final driver = providerItem.drivers[index];

              return rideCard(
                driverId: driver.id,
                context: context,
                name: '${driver.firstName} ${driver.lastName}',
                rating: 4.2,
                dateTime: 'Available Now',
                startLocation: providerItem.pickupLocation,
                endLocation: providerItem.dropOffLocation,
                vehicleModel: driver.car.carType ?? 'Unknown Car',
                fare: '₹ ${0 * 15}',
                driverImage: 'assets/images/profile.svg',
              );
            },
          );
        },
      ),
    );
  }
}
