import 'package:corp_cab_app/app/view/app.dart';
import 'package:corp_cab_app/core/utils/device_info/device_info_utils.dart';
import 'package:corp_cab_app/core/utils/package_info/package_info_utils.dart';
import 'package:corp_cab_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Locator and Utils
  await Future.wait([
    // Locator.locateServices(environment: environment),
    PackageInfoUtils.init(),
    DeviceInfoUtils.init(),
  ]);
  runApp(const App());
}
