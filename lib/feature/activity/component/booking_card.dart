import 'package:corp_cab_app/app/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget bookingCard({
  required BookingModel booking,
}) {
  // Format date & time
  final formattedDate =
      DateFormat('MMM dd, yyyy').format(DateTime.parse(booking.bookingDate));
  final formattedTime = DateFormat('hh:mm a')
      .format(DateTime.parse('2025-03-08T${booking.bookingTime}'));

  // Determine badge color based on status
  final Color statusColor =
      booking.bookingStatus == 'PENDING' ? Colors.orange : Colors.green;

  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ✅ **Booking ID + Status**
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Booking ID: #${booking.id}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                booking.bookingStatus,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// ✅ **Pickup Location**
        Row(
          children: [
            const Icon(
              Icons.radio_button_checked,
              color: Colors.green,
              size: 18,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                'Pickup: ${booking.pickupLocation}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        /// ✅ **Drop Location**
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 18),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                'Drop: ${booking.dropLocation}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// ✅ **Date and Time**
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date: $formattedDate',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            Text(
              'Time: $formattedTime',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
