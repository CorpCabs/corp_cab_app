import 'dart:convert';
import 'dart:developer';
import 'package:corp_cab_app/app/models/DriverModel.dart';
import 'package:corp_cab_app/app/models/booking_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CabBookingRepository {
  CabBookingRepository();

  final String baseUrl = 'http://10.0.2.2:8000';

  Future<List<Driver>> fetchDrivers() async {
    final response = await http.get(Uri.parse('$baseUrl/driver/'));
    log(response.body);
    if (response.statusCode == 200) {
      final drivers = (json.decode(response.body) as List)
          .map((data) => Driver.fromJson(data as Map<String, dynamic>))
          .toList();

      return drivers;
    } else {
      throw Exception('Failed to fetch drivers');
    }
  }

  Future<double> calculateFare(String cabType) async {
    await Future.delayed(const Duration(seconds: 1));
    switch (cabType) {
      case 'Standard':
        return 10.0;
      case 'Premium':
        return 20.0;
      case 'Luxury':
        return 40.0;
      default:
        return 0.0;
    }
  }

  Future<String> bookCab({
    required String pickup,
    required String dropOff,
    required String cabType,
    required DateTime bookingDate,
    required String bookingTime,
    required int employeeId,
    required int companyId,
    int? designatedDriver,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings/'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'booking_date':
            bookingDate.toIso8601String().split('T')[0], // "2025-03-08"
        'booking_time': bookingTime, // Pass the time as a string "10:30 AM"
        'pickup_location': pickup,
        'drop_location': dropOff,
        'booking_status': 'PENDING',
        'employee': employeeId,
        'company': companyId,
        'designated_driver': designatedDriver,
      }),
    );

    if (response.statusCode == 201) {
      return 'Cab booked successfully!';
    } else {
      throw Exception('Failed to book cab: ${response.body}');
    }
  }

  Future<List<BookingModel>> fetchUpcomingBookings() async {
    final response = await http
        .get(Uri.parse('$baseUrl/bookings/?employee=1&booking_status=PENDING'));

    if (response.statusCode == 200) {
      final data =
          List<Map<String, dynamic>>.from(json.decode(response.body) as List);

      return data.map(BookingModel.fromJson).toList();
    } else {
      throw Exception('Failed to fetch upcoming bookings');
    }
  }

  Future<BookingModel> getBookingById(int bookingId) async {
    final response = await http.get(Uri.parse('$baseUrl/bookings/$bookingId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return BookingModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch booking details');
    }
  }
}
