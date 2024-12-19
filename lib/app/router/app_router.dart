// import 'package:auto_route/auto_route.dart';
// import 'package:corp_cab_app/app/router/app_router.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'View,Route')

// /// Holds all the routes that are defined in the app
// /// Used to generate the Router object
// final class AppRouter extends RootStackRouter {
//   @override
//   List<AutoRoute> get routes => [
//         // TODO: Add routes here
//         AutoRoute(
//           initial: true,
//           page: ScaffoldWithNavbar(navigationShell: navigationShell).page,
//         ),
//       ];
// }

import 'package:corp_cab_app/app/router/custom_route_observer.dart';
import 'package:corp_cab_app/feature/auth/Log_In/LogIn.dart';
import 'package:corp_cab_app/feature/auth/OTP_Page/OTPPage.dart';
// import 'package:corp_cab_app/feature/auth/Sign_Up/SignUp.dart';
import 'package:corp_cab_app/feature/activity/view/activity_page.dart';
import 'package:corp_cab_app/feature/auth/Sign_Up/SignUp.dart';
import 'package:corp_cab_app/feature/auth/index.dart';
import 'package:corp_cab_app/feature/book_ride/bookride.dart';
import 'package:corp_cab_app/feature/confirm/confirm.dart';
import 'package:corp_cab_app/feature/index.dart';
import 'package:corp_cab_app/feature/ride_details/details.dart';
import 'package:corp_cab_app/feature/schedule_ride/schedule_ride.dart';
import 'package:corp_cab_app/feature/select_car/select_car.dart';
import 'package:corp_cab_app/feature/Welcome_Page/welcome.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/welcome',
  observers: [
    GoRouterObserver(),
  ],
  routes: <RouteBase>[
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthPage(),
      routes: [
        GoRoute(
          path: '/login-page',
          name: 'login-page',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/OTP-page',
          name: 'OTP-page',
          builder: (context, state) {
            final verificationId = state.extra as String;
            return OTPPage(verificationId: verificationId);
          },
        ),
        GoRoute(
          path: '/signup-page',
          name: 'signup-page',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
              routes: <RouteBase>[
                GoRoute(
                  path: '/book-ride',
                  name: 'book-ride',
                  builder: (context, state) => const BookRidePage(),
                ),
                GoRoute(
                  path: '/schedule-ride',
                  name: 'schedule-ride',
                  builder: (context, state) => const ScheduleRidePage(),
                ),
                GoRoute(
                  path: '/select-car',
                  name: 'select-car',
                  builder: (context, state) => const CarSelectionPage(),
                ),
                GoRoute(
                  path: '/driver-list',
                  name: 'driver-list',
                  builder: (context, state) => const DriverListPage(),
                ),
                GoRoute(
                  path: '/booking-confirm',
                  name: 'booking-confirm',
                  builder: (context, state) => const YourRidePage(),
                ),
                GoRoute(
                  path: '/ride-details',
                  name: 'ride-details',
                  builder: (context, state) => const RideDetailsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/activity',
              name: 'activity',
              builder: (context, state) => const ActivityPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/setting',
              builder: (context, state) =>
                  SettingsPage(), // Assuming SettingsPage is imported and defined
            ),
          ],
        ),
      ],
    ),
  ],
);
