import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/data/repositories/events_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/presentation/state/events/selected_event.dart';
import 'package:amacom_app/src/presentation/state/forms/forms_data_providers.dart';
import 'package:amacom_app/src/presentation/views/calendar/widgets.dart/delete_event.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shows a form used to edit an event
class EditEvent extends ConsumerWidget {
  ///
  const EditEvent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    final theme = Theme.of(context);
    final eventData = ref.watch(selectedEventProvider);
    final eventDataNotifier = ref.read(selectedEventProvider.notifier);
    return Material(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      child: Container(
        height: responsive.maxHeightValue(500),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.cardRadius),
                  topRight: Radius.circular(AppConstants.cardRadius),
                ),
                color: theme.primaryColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      appLocalizations?.editEvent ?? '',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: FigmaColors.getFontColorForBackground(
                          theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const DeleteEvent(),
                ],
              ),
            ),
            Expanded(
              child: ScrollColumnExpandable(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SafeSpacer(),
                  ref.watch(eventTypesProvider).when(
                        data: (data) {
                          return CustomDropDownFrom(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText:
                                '${appLocalizations?.selectAn}${appLocalizations?.eventType.toLowerCase()}',
                            labelText: appLocalizations?.eventType ?? '',
                            value: eventData?.eventTypeId,
                            items: data
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => eventDataNotifier.update(
                              (state) => state?.copyWith(eventTypeId: value),
                            ),

                            // validator: AppValidations.notEmptyFieldValidation,
                          );
                        },
                        error: (error, stackTrace) {
                          GlobalLocator.appLogger.e(error);
                          return CustomErrorWidget(error: error);
                        },
                        loading: () => const SizedCustomProgressIndicator2(),
                      ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          enabled: false,
                          controller: TextEditingController(
                            text: eventData?.from.timeToText(),
                          ),
                          labelText: appLocalizations?.from ?? '',
                          textCapitalization: TextCapitalization.none,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: eventData?.from.hour ?? 0,
                                minute: eventData?.from.minute ?? 0,
                              ),
                            );
                            eventDataNotifier.update(
                              (state) {
                                int? minute = pickedTime?.minute;
                                int? hour = pickedTime?.hour;
                                if (pickedTime?.period == DayPeriod.pm &&
                                    hour == 12) {
                                  minute = 59;
                                  hour = 23;
                                }
                                final temp = state?.from.copyWith(
                                  hour: hour,
                                  minute: minute,
                                );
                                return state?.copyWith(
                                  to: temp,
                                );
                              },
                            );
                          },
                          child: Builder(
                            builder: (context) {
                              return CustomTextFormField(
                                enabled: false,
                                controller: TextEditingController(
                                  text: eventData?.to.timeToText(),
                                ),
                                showRequiredIndicator: true,
                                labelText: appLocalizations?.to ?? '',
                                textCapitalization: TextCapitalization.none,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    labelText: appLocalizations?.eventName ?? '',
                    initialValue: eventData?.eventName,
                    hintText:
                        '${appLocalizations?.writeHere} ${appLocalizations?.eventName.toLowerCase()}',
                    showRequiredIndicator: true,
                    fillColor: Colors.white,
                    onChanged: (value) {
                      eventDataNotifier.update(
                        (state) => state?.copyWith(eventName: value),
                      );
                    },
                  ),
                  CustomTextFormField(
                    labelText: appLocalizations?.eventDescription ?? '',
                    controller: TextEditingController(
                      text: eventData?.description,
                    ),
                    hintText:
                        '${appLocalizations?.writeHere} ${appLocalizations?.eventDescription.toLowerCase()}',
                    showRequiredIndicator: true,
                    fillColor: Colors.white,
                    maxLines: 2,
                    minLines: 2,
                    onChanged: (value) {
                      eventDataNotifier.update(
                        (state) => state?.copyWith(description: value),
                      );
                    },
                  ),
                  CustomButtonWithState(
                    text: appLocalizations?.save ?? '',
                    enabled: eventData?.validate() ?? false,
                    onTap: () async {
                      try {
                        final result = await ref
                            .read(eventsRepository)
                            .updateEvent(eventData!);
                        ref
                            .read(calendarEventsProvider.notifier)
                            .update((state) {
                          final events = List<Event>.from(state);
                          events.removeWhere(
                            (element) => element.id == result.id,
                          );
                          events.add(result);
                          return events;
                        });
                        Navigation.goBack();
                      } catch (e) {
                        GlobalLocator.appLogger.e(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
