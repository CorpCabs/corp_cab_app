import 'package:corp_cab_app/app/providers/auth_provider.dart';
import 'package:corp_cab_app/app/router/custom_route_observer.dart';
import 'package:corp_cab_app/feature/Welcome_Page/welcome.dart';
import 'package:corp_cab_app/feature/auth/Log_In/LogIn.dart';
import 'package:corp_cab_app/feature/auth/OTP_Page/OTPPage.dart';
import 'package:corp_cab_app/feature/activity/view/activity_page.dart';
import 'package:corp_cab_app/feature/auth/Sign_Up/SignUp.dart';
import 'package:corp_cab_app/feature/auth/index.dart';
import 'package:corp_cab_app/feature/confirm/confirm.dart';
import 'package:corp_cab_app/feature/index.dart';
import 'package:corp_cab_app/feature/notifications/notifications.dart';
import 'package:corp_cab_app/feature/ride_details/details.dart';
import 'package:corp_cab_app/feature/schedule_ride/schedule_ride.dart';
import 'package:corp_cab_app/feature/select_car/select_car.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: '/welcome',
//   observers: [
//     GoRouterObserver(),
//   ],
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/welcome',
//       name: 'welcome',
//       builder: (context, state) => const WelcomePage(),
//     ),
//     GoRoute(
//       path: '/auth',
//       builder: (context, state) => const AuthPage(),
//       routes: [
//         GoRoute(
//           path: '/login-page',
//           name: 'login-page',
//           builder: (context, state) => const LoginPage(),
//         ),
//         GoRoute(
//           path: '/OTP-page',
//           name: 'OTP-page',
//           builder: (context, state) {
//             final verificationId = state.extra! as String;
//             return OTPPage(verificationId: verificationId);
//           },
//         ),
//         GoRoute(
//           path: '/signup-page',
//           name: 'signup-page',
//           builder: (context, state) => const SignUpPage(),
//         ),
//       ],
//     ),
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         return ScaffoldWithNavbar(
//           navigationShell: navigationShell,
//         );
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: <RouteBase>[
//             GoRoute(
//               path: '/home',
//               name: 'home',
//               builder: (context, state) => const HomePage(),
//               routes: <RouteBase>[
//                 GoRoute(
//                   path: '/schedule-ride',
//                   name: 'schedule-ride',
//                   builder: (context, state) => const ScheduleRidePage(),
//                 ),
//                 GoRoute(
//                   path: '/select-car',
//                   name: 'select-car',
//                   builder: (context, state) => const CarSelectionPage(),
//                 ),
//                 GoRoute(
//                   path: '/driver-list',
//                   name: 'driver-list',
//                   builder: (context, state) => const DriverListPage(),
//                 ),
//                 GoRoute(
//                   path: '/booking-confirm',
//                   name: 'booking-confirm',
//                   builder: (context, state) => const YourRidePage(),
//                 ),
//                 GoRoute(
//                   path: '/ride-details',
//                   name: 'ride-details',
//                   builder: (context, state) => const RideDetailsPage(),
//                 ),
//                 GoRoute(
//                   path: '/notifications',
//                   name: 'notifications',
//                   builder: (context, state) => const NotificationsScreen(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: <RouteBase>[
//             GoRoute(
//               path: '/activity',
//               name: 'activity',
//               builder: (context, state) => const ActivityPage(),
//               routes: [
//                 GoRoute(
//                   path: '/ride-details',
//                   name: 'activity-ride-details',
//                   builder: (context, state) => const RideDetailsPage(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           navigatorKey: _sectionNavigatorKey,
//           routes: <RouteBase>[
//             GoRoute(
//               path: '/setting',
//               builder: (context, state) =>
//                   const SettingsPage(), // Assuming SettingsPage is imported and defined
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );

GoRouter getRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: authProvider.user != null ? '/home' : '/welcome',
    refreshListenable: authProvider, // Listen for changes in auth state
    routes: [
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/auth/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/auth/OTP-page',
        name: 'OTP-page',
        builder: (context, state) {
          return const OTPPage();
        },
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
    redirect: (context, state) {
      final isAuthenticated = authProvider.user != null;
      final isLoggingIn =
          state.fullPath == '/auth/login' || state.fullPath == '/auth/OTP-page';

      if (!isAuthenticated && !isLoggingIn) {
        return '/welcome';
      } else if (isAuthenticated && isLoggingIn) {
        return '/home';
      }
      return null;
    },
  );
}
