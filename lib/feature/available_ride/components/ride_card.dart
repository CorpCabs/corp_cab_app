import 'package:corp_cab_app/app/common/toast.dart';
import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Widget rideCard({
  required BuildContext context,
  required int driverId,
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
                Text(
                  '⭐ $rating Rating',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
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
            const Icon(
              Icons.radio_button_checked,
              color: Colors.green,
              size: 18,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                startLocation,
                style: const TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
            Expanded(
              child: Text(
                endLocation,
                style: const TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
                  'Vehicle Model',
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
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Consumer<CabBookingProvider>(
            builder: (context, provider, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: provider.isLoading
                    ? null
                    : () async {
                        provider.setDesignatedDriver(driverId);

                        final result = await provider.bookCab();

                        if (result.toLowerCase().contains('success')) {
                          if (context.mounted) {
                            await context.pushNamed('booking-confirm');
                          }
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(result),
                          //     backgroundColor: Colors.red,
                          //   ),
                          // );
                          ToastUtils.showErrorToast(result);
                        }
                      },
                child: provider.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Request Ride',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
