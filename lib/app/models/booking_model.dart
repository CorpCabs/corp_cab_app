class BookingModel {
  BookingModel({
    required this.id,
    required this.bookingDate,
    required this.bookingTime,
    required this.pickupLocation,
    required this.dropLocation,
    required this.bookingStatus,
    required this.employeeId,
    required this.companyId,
    required this.designatedDriverId,
  });


  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as int,
      bookingDate: json['booking_date'] as String,
      bookingTime: json['booking_time'] as String,
      pickupLocation: json['pickup_location'] as String,
      dropLocation: json['drop_location'] as String,
      bookingStatus: json['booking_status'] as String,
      employeeId: json['employee'] as int,
      companyId: json['company'] as int,
      designatedDriverId: json['designated_driver'] as int,
    );
  }
  final int id;
  final String bookingDate;
  final String bookingTime;
  final String pickupLocation;
  final String dropLocation;
  final String bookingStatus;
  final int employeeId;
  final int companyId;
  final int designatedDriverId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'booking_date': bookingDate,
      'booking_time': bookingTime,
      'pickup_location': pickupLocation,
      'drop_location': dropLocation,
      'booking_status': bookingStatus,
      'employee': employeeId,
      'company': companyId,
      'designated_driver': designatedDriverId,
    };
  }
}
