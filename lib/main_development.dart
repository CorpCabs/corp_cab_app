import 'package:corp_cab_app/app/environment/development_environment.dart';
import 'package:corp_cab_app/app/view/app.dart';
import 'package:corp_cab_app/bootstrap.dart';
import 'package:corp_cab_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await bootstrap(builder: App.new, environment: DevelopmentEnvironment());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
