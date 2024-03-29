import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User password recovering email provider
final passRecoveringEmailProvider = StateProvider<String?>((ref) => null);

/// User password recovering password provider
final passRecoveringPasswordProvider = StateProvider<String?>((ref) => null);

/// Registration screen page index
final passRecoveringIndexProvider = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
);
