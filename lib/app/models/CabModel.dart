class Vehicle {
  Vehicle({
    required this.id,
    required this.type,
    required this.seat,
    required this.imagePath,
  });

  // Factory method to create a Vehicle from a Map
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'] as int,
      type: map['type'] as String,
      seat: map['seat'] as int,
      imagePath: map['imagePath'] as String,
    );
  }
  final int id;
  final String type;
  final int seat;
  final String imagePath;

  // Method to convert a Vehicle to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': type,
      'seat': seat,
      'imagePath': imagePath,
    };
  }
}
