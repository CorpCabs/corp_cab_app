import 'package:corp_cab_app/app/constants/string_constants.dart';
import 'package:corp_cab_app/app/l10n/l10n.dart';

import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/app/repository/cab_booking_repository.dart';
import 'package:corp_cab_app/app/router/app_router.dart' as app_router;
import 'package:corp_cab_app/app/theme/light/light_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   // final _appRouter = AppRouter();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       // App Name
//       title: StringConstants.appName,
//       // theme: LightTheme().theme,
//       // darkTheme: DarkTheme().theme,
//       theme: LightTheme().theme,

//       // Localization
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,

//       // Routing
//       // routerConfig: _appRouter.config(
//       //   navigatorObservers: () => [CustomRouteObserver()],
//       // ),
//       routerConfig: app_router.getRouter(authProvider),
//       builder: FToastBuilder(),
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final cabRepositoryProvider = CabBookingRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CabBookingProvider>(
          create: (_) => CabBookingProvider(cabRepositoryProvider),
        ),
      ],
      child: Builder(
        builder: (context) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return MaterialApp.router(
                title: StringConstants.appName,
                theme: LightTheme().theme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: app_router.getRouter(snapshot.data),
                builder: FToastBuilder(),
              );
            },
          );
        },
      ),
    );
  }
}
