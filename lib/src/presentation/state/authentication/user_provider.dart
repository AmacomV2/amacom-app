

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/entities/user.dart';

/// User data provider
final userProvider = FutureProvider.autoDispose<User>((ref) {
  return ref.read(userRepository).getUserData();
},);