import 'package:flutter_riverpod/flutter_riverpod.dart';

/// oldPassword query provider
final oldPasswordProvider = StateProvider<String>((ref) => '');

/// new password query provider
final newPasswordProvider = StateProvider<String>((ref) => '');
