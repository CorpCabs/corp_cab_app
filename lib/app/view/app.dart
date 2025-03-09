import 'package:corp_cab_app/app/constants/string_constants.dart';
import 'package:corp_cab_app/app/l10n/l10n.dart';
import 'package:corp_cab_app/app/providers/auth_provider.dart';
import 'package:corp_cab_app/app/router/app_router.dart' as app_router;
import 'package:corp_cab_app/app/theme/light/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

import 'package:corp_cab_app/app/constants/string_constants.dart';
import 'package:corp_cab_app/app/l10n/l10n.dart';
import 'package:corp_cab_app/app/providers/auth_provider.dart';
import 'package:corp_cab_app/app/router/app_router.dart' as app_router;
import 'package:corp_cab_app/app/theme/light/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [  
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        // Add more providers here as needed
        // ChangeNotifierProvider<AnotherProvider>(
        //   create: (context) => AnotherProvider(),
        // ),
      ],
      child: Builder(
        builder: (context) {
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          return MaterialApp.router(
            title: StringConstants.appName,
            theme: LightTheme().theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: app_router.getRouter(authProvider),
            builder: FToastBuilder(),
          );
        },
      ),
    );
  }
}
