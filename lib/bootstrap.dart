import 'dart:async';

import 'package:corp_cab_app/app/environment/app_environment.dart';
import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/app/repository/cab_bookimg_repository.dart';
import 'package:corp_cab_app/core/utils/device_info/device_info_utils.dart';
import 'package:corp_cab_app/core/utils/logger/logger_utils.dart';
import 'package:corp_cab_app/core/utils/package_info/package_info_utils.dart';
import 'package:corp_cab_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required AppEnvironment environment,
}) async {
  FlutterError.onError = (details) {
    LoggerUtils.instance
        .logFatalError(details.exceptionAsString(), details.stack);
  };
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Locator and Utils
      await Future.wait([
        // Locator.locateServices(environment: environment),
        PackageInfoUtils.init(),
        DeviceInfoUtils.init(),
      ]);

      final cabRepositoryProvider = CabBookingRepository();

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<CabBookingProvider>(
              create: (_) => CabBookingProvider(cabRepositoryProvider),
            ),
          ],
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) {
      LoggerUtils.instance.logFatalError(error.toString(), stackTrace);
    },
  );
}
