import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation page index provider
final newSituationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

/// New situation page index provider
final creatingSituationProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// New situation page index provider
final affectationDegreeProvider = StateProvider<int?>((ref) => null);

/// New situation description provider
final situationDescriptionProvider = StateProvider<String?>((ref) => null);

/// New situation First thought provider
final situationFirstThoughtProvider = StateProvider<String?>((ref) => null);

/// New situation behavior provider
final situationBehaviorProvider = StateProvider<String?>((ref) => null);

/// New situation feelings provider
final situationFeelingsProvider = StateProvider<List<GenericData>>((ref) => []);

/// New situation baby alarmSign provider
final babySituationAlarmSignsProvider =
    StateProvider<List<AlarmSignEntity>>((ref) => []);

/// New situation mother alarmSign provider
final motherSituationAlarmSignsProvider =
    StateProvider<List<AlarmSignEntity>>((ref) => []);

/// New situation mother alarmSign provider
final newSituationForm1Key =
    StateProvider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

/// New situation mother alarmSign provider
final newSituationForm2Key =
    StateProvider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());
