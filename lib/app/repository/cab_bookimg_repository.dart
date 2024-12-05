class CabBookingRepository {
  CabBookingRepository();

  Future<double> calculateFare(String cabType) async {
    // Simulate API call for fare calculation
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

  Future<String> bookCab(String pickup, String dropOff, String cabType) async {
    if (pickup.isEmpty || dropOff.isEmpty) {
      throw Exception('Pickup and Drop-off locations are required.');
    }
    // Simulate API call for booking
    await Future.delayed(const Duration(seconds: 2));
    return 'Cab booked successfully!';
  }
}
