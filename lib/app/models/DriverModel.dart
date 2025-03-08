// class Driver {
//   Driver({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phoneNumber,
//     required this.email,
//     required this.car,
//   });

//   // Factory method to create Driver from JSON
//   factory Driver.fromJson(Map<String, dynamic> json) {
//     return Driver(
//       id: json['id'] as int,
//       firstName: json['first_name'] as String,
//       lastName: json['last_name'] as String,
//       phoneNumber: json['phone_number'] as String,
//       email: json['email'] as String,
//       car: json['car'] as int,
//     );
//   }
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   final String email;
//   final int car;

//   // Convert Driver object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'phone_number': phoneNumber,
//       'email': email,
//       'car': car,
//     };
//   }

//   // Utility method to copy the driver object
//   Driver copyWith({
//     int? id,
//     String? firstName,
//     String? lastName,
//     String? phoneNumber,
//     String? email,
//     int? car,
//   }) {
//     return Driver(
//       id: id ?? this.id,
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       email: email ?? this.email,
//       car: car ?? this.car,
//     );
//   }

//   // Utility method to create a list of drivers from JSON
//   static List<Driver> fromJsonList(List<dynamic> jsonList) {
//     return jsonList
//         .map((json) => Driver.fromJson(json as Map<String, dynamic>))
//         .toList();
//   }
// }

class Driver {
  Driver({
    required this.id,
    required this.car,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  // Factory method to create Driver from JSON
  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
    );
  }
  final int id;
  final Car car;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
}

class Car {
  Car({
    required this.id,
    required this.carName,
    required this.licensePlate,
    required this.carType,
    required this.carCapacity,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as int,
      carName: json['car_name'] as String,
      licensePlate: json['license_plate'] as String,
      carType: json['car_type'] as String,
      carCapacity: json['car_capacity'] as int,
    );
  }
  final int id;
  final String carName;
  final String licensePlate;
  final String carType;
  final int carCapacity;
}
