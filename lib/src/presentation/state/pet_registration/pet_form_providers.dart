import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pet registration image state provider
final petRegistrationImageProvider = StateProvider.autoDispose<File?>((ref) => null);

/// Pet registration gender provider
final petRegistrationGenderProvider = StateProvider.autoDispose<String?>((ref) => null);

/// Pet registration gender provider
final petRegistrationBreedProvider = StateProvider.autoDispose<String?>((ref) => null);