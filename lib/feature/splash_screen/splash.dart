// import 'dart:async';
// import 'package:corp_cab_app/core/extensions/context_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Simulate a delay for the splash screen
//     Timer(Duration(seconds: 3), () {
//       // Navigate to the login page after 3 seconds
//       context.pushNamed('login-page');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green, // Background color of the splash screen
//       body: Center(
//         child: Image.asset(
//           'assets/images/splash.png', // Add your splash image path here
//           height: MediaQueryExtension(context).veryhighValue2x,
//         ),
//       ),
//     );
//   }
// }
