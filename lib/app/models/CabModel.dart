class Vehicle {
  Vehicle({
    required this.id,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  // Factory method to create a Vehicle from a Map
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['title'] as int,
      title: map['title'] as String,
      price: map['price'] as String,
      imagePath: map['imagePath'] as String,
    );
  }
  final int id;
  final String title;
  final String price;
  final String imagePath;

  // Method to convert a Vehicle to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imagePath': imagePath,
    };
  }
}
