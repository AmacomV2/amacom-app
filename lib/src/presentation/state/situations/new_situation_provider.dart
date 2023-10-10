import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation page index provider
final newSituationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

/// New situation page index provider
final affectationDegreeProvider = StateProvider<int?>((ref) => null);
