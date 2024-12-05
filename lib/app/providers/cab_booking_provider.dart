import 'package:corp_cab_app/app/repository/cab_bookimg_repository.dart';
import 'package:flutter/material.dart';

class CabBookingProvider with ChangeNotifier {
  CabBookingProvider(this._repository);
  final CabBookingRepository _repository;

  // State variables
  String _pickupLocation = '';
  String _dropOffLocation = '';
  String _selectedCabType = 'Standard';
  final double _fare = 0;
  bool _isLoading = false;
  final List<Map<String, dynamic>> _vehicleData = [
    {
      'title': 'Economy',
      'price': '548₽',
      'imagePath': 'assets/economy.png',
      'isSelected': true,
    },
    {
      'title': 'Comfort',
      'price': '864₽',
      'imagePath': 'assets/comfort.png',
      'isSelected': false,
    },
    {
      'title': 'Business',
      'price': '1200₽',
      'imagePath': 'assets/business.png',
      'isSelected': false,
    },
    {
      'title': 'Luxury',
      'price': '1800₽',
      'imagePath': 'assets/luxury.png',
      'isSelected': false,
    },
    {
      'title': 'Luxury',
      'price': '1800₽',
      'imagePath': 'assets/luxury.png',
      'isSelected': false,
    },
  ];

  // Getters
  String get pickupLocation => _pickupLocation;
  String get dropOffLocation => _dropOffLocation;
  String get selectedCabType => _selectedCabType;
  double get fare => _fare;
  List<Map<String, dynamic>> get vehicleData => _vehicleData;
  bool get isLoading => _isLoading;

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
}
