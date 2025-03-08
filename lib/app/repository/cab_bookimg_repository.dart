import 'dart:convert';
import 'dart:developer';
import 'package:corp_cab_app/app/models/DriverModel.dart';
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
    const apiUrl = 'http://0.0.0.0:8000/api/booking/';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFTOKEN':
            'dS9ksGppPsKkJYjjapmYEcA53HbzRjtOkbW9xLxE66wx0o8IZ8Mr3junvRU5iOIn',
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
}
