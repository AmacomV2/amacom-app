import 'package:amacom_app/src/domain/dtos/person_dto.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:amacom_app/src/domain/entities/navigation_bar_selection.dart';

/// Used to know if personal data is able to edit.
final editEnabledPersonalDataProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);

/// Used to know if personal data is able to edit.
final personalDataDTOProvider = Provider.autoDispose<PersonEditDTO?>(
  (ref) {
    final userData = ref.read(userProvider).value;
    return PersonEditDTO(
      lastName: userData?.lastName ?? '',
      name: userData?.name ?? '',
      document: userData?.documentNo ?? '',
      birthDate: userData?.birthDay,
      consentText: userData?.consentText == true,
      genderId: userData?.genderId ?? '',
      documentTypeId: userData?.documentTypeId ?? '',
      occupation: userData?.occupation ?? '',
      address: userData?.address ?? '',
      civilStatusId: (userData?.civilStatusId ?? '').isEmpty
          ? null
          : userData?.civilStatusId,
      id: userData?.id ?? '',
    );
  },
);
