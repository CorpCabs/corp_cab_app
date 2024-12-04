// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:corp_cab_app/feature/home/view/home_view.dart' as _i1;
import 'package:go_router/go_router.dart' as _i3;

/// generated route for
/// [_i1.ScaffoldWithNavbar]
class ScaffoldWithNavbar extends _i2.PageRouteInfo<ScaffoldWithNavbarArgs> {
  ScaffoldWithNavbar({
    required _i3.StatefulNavigationShell navigationShell,
    _i4.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          ScaffoldWithNavbar.name,
          args: ScaffoldWithNavbarArgs(
            navigationShell: navigationShell,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ScaffoldWithNavbar';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScaffoldWithNavbarArgs>();
      return _i1.ScaffoldWithNavbar(
        navigationShell: args.navigationShell,
        key: args.key,
      );
    },
  );
}

class ScaffoldWithNavbarArgs {
  const ScaffoldWithNavbarArgs({
    required this.navigationShell,
    this.key,
  });

  final _i3.StatefulNavigationShell navigationShell;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ScaffoldWithNavbarArgs{navigationShell: $navigationShell, key: $key}';
  }
}
