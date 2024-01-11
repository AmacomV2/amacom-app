import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/entities/person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User data provider
final userProvider = FutureProvider.autoDispose<Person>(
  (ref) {
    return ref.read(userRepository).getUserData();
  },
);
