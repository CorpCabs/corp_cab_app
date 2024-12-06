import 'package:corp_cab_app/app/models/DriverModel.dart';
import 'package:flutter/material.dart';

class DriverProvider with ChangeNotifier {
  final List<Driver> _drivers = [
    Driver(id: 1, name: 'John Doe', rating: 4.5),
    Driver(id: 2, name: 'Jane Smith', rating: 4.7),
    Driver(id: 3, name: 'Samuel Green', rating: 4.6),
    Driver(id: 4, name: 'Emily Johnson', rating: 4.8),
    Driver(id: 5, name: 'Michael Brown', rating: 4.4),
  ];

  Driver? _selectedDriver;
  final bool _isLoading = false;
  List<Driver> get drivers => _drivers;

  Driver? get selectedDriver => _selectedDriver;
  bool get isLoading => _isLoading;
  void selectDriver(Driver driver) {
    _selectedDriver = driver;
    notifyListeners();
  }
}
