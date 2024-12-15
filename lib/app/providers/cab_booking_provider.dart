import 'package:corp_cab_app/app/models/CabModel.dart';
import 'package:corp_cab_app/app/repository/cab_bookimg_repository.dart';
import 'package:flutter/material.dart';

class CabBookingProvider with ChangeNotifier {
  CabBookingProvider(this._repository);
  final CabBookingRepository _repository;

  // State variables
  int? _selectedIndex;
  String _pickupLocation = '';
  String _dropOffLocation = '';
  String _selectedCabType = 'Standard';
  final double _fare = 0;
  bool _isLoading = false;
  bool _isError = false;
  DateTime _selectedDate = DateTime.now(); // Initialize with current date
  TimeOfDay _selectedTime = TimeOfDay.now(); // Initialize with current time
  final List<Vehicle> _vehicleData = [
    Vehicle(
      id: 1,
      type: 'Economy',
      seat: 4,
      imagePath: 'assets/images/car.png',
    ),
    Vehicle(
      id: 2,
      type: 'Luxury',
      seat: 6,
      imagePath: 'assets/images/SUV.png',
    ),
  ];

  // Getters
  String get pickupLocation => _pickupLocation;
  String get dropOffLocation => _dropOffLocation;
  String get selectedCabType => _selectedCabType;
  double get fare => _fare;
  List<Vehicle> get vehicleData => _vehicleData;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  int get selectedIndex => _selectedIndex ?? -1;
  DateTime get selectedDate => _selectedDate; // Getter for selectedDate
  TimeOfDay get selectedTime => _selectedTime; // Getter for selectedTime

  // Setters
  void setPickupLocation(String location) {
    _pickupLocation = location;
    notifyListeners();
  }

  void setDropOffLocation(String location) {
    _dropOffLocation = location;
    notifyListeners();
  }

  void selectCabType(String cabType) {
    _selectedCabType = cabType;
    calculateFare();
    notifyListeners();
  }

  Future<void> calculateFare() async {
    try {
      _isLoading = true;
      notifyListeners();
      // _fare = await _repository.calculateFare(_selectedCabType);
    } catch (e) {
      debugPrint('Error calculating fare: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> bookCab() async {
    try {
      _isLoading = true;
      notifyListeners();
      return await _repository.bookCab(
        _pickupLocation,
        _dropOffLocation,
        _selectedCabType,
      );
    } catch (e) {
      return 'Error booking cab: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(bool value) {
    _isError = value;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }
}
