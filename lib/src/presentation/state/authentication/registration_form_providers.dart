import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User registration name provider
final regNameProvider = StateProvider<String?>((ref) => null);

/// User registration lastName provider
final regLastNameProvider = StateProvider<String?>((ref) => null);

/// User registration email provider
final regEmailProvider = StateProvider<String?>((ref) => null);

/// User registration phone provider
final regPhoneProvider = StateProvider<String?>((ref) => null);

/// User registration password provider
final regPasswordProvider = StateProvider<String?>((ref) => null);

/// User registration confirm password provider
final regTermsAndConditionsProvider = StateProvider<bool>((ref) => false);