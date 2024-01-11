import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User registration name provider
final regNameProvider = StateProvider<String?>((ref) => null);

/// User registration lastName provider
final regLastNameProvider = StateProvider<String?>((ref) => null);

/// User registration email provider
final regEmailProvider = StateProvider<String?>((ref) => null);

/// User registration birthDate provider
final regBirthDateProvider = StateProvider<DateTime?>((ref) => null);

/// User registration DocumentNo provider
final regDocumentNoProvider = StateProvider<String?>((ref) => null);

/// User registration Occupation provider
final regOccupationProvider = StateProvider<String?>((ref) => null);

/// User registration Occupation provider
final regUsernameProvider = StateProvider<String?>((ref) => null);

/// User registration Address provider
final regAddressProvider = StateProvider<String?>((ref) => null);

/// User registration password provider
final regPasswordProvider = StateProvider<String?>((ref) => null);

/// User registration password provider
final regGenderProvider = StateProvider<String?>((ref) => null);

/// User registration password provider
final regDocumentTypeProvider = StateProvider<String?>((ref) => null);

/// User registration password provider
final regCivilStatusProvider = StateProvider<String?>((ref) => null);

/// User registration confirm password provider
final regTermsAndConditionsProvider = StateProvider<bool>((ref) => false);
