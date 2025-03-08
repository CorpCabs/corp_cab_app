// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_environment.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _ProductionEnvironment {
  static const List<int> _enviedkeybaseUrl = <int>[
    2621483287,
    1855759157,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    2621483312,
    1855759122,
  ];

  static final String baseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]));
}
