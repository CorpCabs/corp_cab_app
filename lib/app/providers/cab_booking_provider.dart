import 'dart:math';

import 'package:corp_cab_app/app/models/CabModel.dart';
import 'package:corp_cab_app/app/models/DriverModel.dart';
import 'package:corp_cab_app/app/models/booking_model.dart';
import 'package:corp_cab_app/app/repository/cab_booking_repository.dart';
import 'package:flutter/material.dart';

class CabBookingProvider with ChangeNotifier {
  CabBookingProvider(this._repository);
  final CabBookingRepository _repository;

  // State variables
  int? _selectedIndex;
  String _pickupLocation = '';
  String _dropOffLocation = '';
  String _selectedCabType = 'Standard';
  double _fare = 0;
  bool _isLoading = false;
  final bool _isError = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int? _employeeId;
  int? _companyId;
  int? _designatedDriver;
  List<Driver> _drivers = [];
  bool _isFetchingDrivers = false;
  bool _hasDriverFetchError = false;

  List<BookingModel> _upcomingBookings = [];
  bool _isLoadingUpcoming = false;
  bool _hasUpcomingFetchError = false;

  // Static Vehicle Data
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

  // ✅ **Getters**
  String get pickupLocation => _pickupLocation;
  String get dropOffLocation => _dropOffLocation;
  String get selectedCabType => _selectedCabType;
  double get fare => _fare;
  List<Vehicle> get vehicleData => _vehicleData;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  int get selectedIndex => _selectedIndex ?? -1;
  DateTime get selectedDate => _selectedDate;
  TimeOfDay get selectedTime => _selectedTime;
  int? get employeeId => _employeeId;
  int? get companyId => _companyId;
  int? get designatedDriver => _designatedDriver;
  List<Driver> get drivers => _drivers;
  bool get isFetchingDrivers => _isFetchingDrivers;
  bool get hasDriverFetchError => _hasDriverFetchError;
  List<BookingModel> get upcomingBookings => _upcomingBookings;
  bool get isLoadingUpcoming => _isLoadingUpcoming;
  bool get hasUpcomingFetchError => _hasUpcomingFetchError;

  // ✅ **Setters**
  void setPickupLocation(String location) {
    _pickupLocation = location;
    notifyListeners();
  }

  void setDropOffLocation(String location) {
    _dropOffLocation = location;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void selectCabType(String cabType) {
    _selectedCabType = cabType;
    calculateFare();
    notifyListeners();
  }

  void setEmployeeId(int id) {
    _employeeId = id;
    notifyListeners();
  }

  void setCompanyId(int id) {
    _companyId = id;
    notifyListeners();
  }

  void setDesignatedDriver(int? id) {
    _designatedDriver = id;
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

  Future<void> fetchDrivers() async {
    try {
      _isFetchingDrivers = true;
      _hasDriverFetchError = false;
      notifyListeners();

      final fetchedDrivers = await _repository.fetchDrivers();
      _drivers = fetchedDrivers;

      if (fetchedDrivers.isNotEmpty) {
        setDesignatedDriver(fetchedDrivers.first.id);
      }
    } catch (e) {
      _hasDriverFetchError = true;
      debugPrint('Error fetching drivers: $e');
    } finally {
      _isFetchingDrivers = false;
      notifyListeners();
    }
  }


  Future<void> calculateFare() async {
    try {
      _isLoading = true;
      notifyListeners();
      _fare = await _repository.calculateFare(_selectedCabType);
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

      if (_pickupLocation.isEmpty || _dropOffLocation.isEmpty) {
        return 'Pickup and Drop-off locations are required.';
      }

      // TODO Temp for demo
      _employeeId = 1;
      _companyId = 1;

      if (_employeeId == null || _companyId == null) {
        return 'Employee and Company are required.';
      }

      final bookingTime = '${_selectedTime.hour}:${_selectedTime.minute}';

      return await _repository.bookCab(
        pickup: _pickupLocation,
        dropOff: _dropOffLocation,
        cabType: _selectedCabType,
        bookingDate: _selectedDate,
        bookingTime: bookingTime,
        employeeId: _employeeId!,
        companyId: _companyId!,
        designatedDriver: _designatedDriver,
      );
    } catch (e) {
      return 'Error booking cab: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUpcomingBookings() async {
    _isLoadingUpcoming = true;
    _hasUpcomingFetchError = false;
    notifyListeners();

    try {
      _upcomingBookings = await _repository.fetchUpcomingBookings();
    } catch (error) {
      _hasUpcomingFetchError = true;
    }

    _isLoadingUpcoming = false;
    notifyListeners();
  }
}
