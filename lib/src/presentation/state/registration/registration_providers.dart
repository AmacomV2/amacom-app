import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration screen page index
final registrationIndexProvider = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
);
