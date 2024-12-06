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
  final List<Vehicle> _vehicleData = [
    Vehicle(
      id: 1,
      title: 'Economy',
      price: '548₽',
      imagePath: 'assets/economy.png',
    ),
    Vehicle(
      id: 2,
      title: 'Comfort',
      price: '864₽',
      imagePath: 'assets/comfort.png',
    ),
    Vehicle(
      id: 3,
      title: 'Business',
      price: '1200₽',
      imagePath: 'assets/business.png',
    ),
    Vehicle(
      id: 4,
      title: 'Luxury',
      price: '1800₽',
      imagePath: 'assets/luxury.png',
    ),
    Vehicle(
      id: 5,
      title: 'Luxury',
      price: '1800₽',
      imagePath: 'assets/luxury.png',
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
}
