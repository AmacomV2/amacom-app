import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

import 'package:go_router/go_router.dart';

import 'package:amacom_app/src/utils/constant/constants.dart';

import 'package:amacom_app/src/presentation/views/petRegistration/widgets/pet_registration_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

final _pageIndexController = StateProvider.autoDispose<int>((ref) => 0);

/// Pet's registration screen
///
/// Form to register a new pet for user, specifying pet data
class PetRegistrationScreen extends ConsumerStatefulWidget {
  /// Widget constructor
  const PetRegistrationScreen({super.key});

  @override
  ConsumerState<PetRegistrationScreen> createState() =>
      _PetRegistrationScreenState();
}

class _PetRegistrationScreenState extends ConsumerState<PetRegistrationScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      ref
          .read(_pageIndexController.notifier)
          .update((state) => state = _controller.page?.toInt() ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const SpecieSelector(),
      const PetInformationForm(),
    ];
    return Scaffold(
      body: ColumnWithPadding(
        children: [
          AuthHeader(
            title: _title(ref.watch(_pageIndexController)),
          ),
          const SafeSpacer(
            height: 16,
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          const SafeSpacer(),
          BottomButtons(
            backButtonText: _buttonText(ref.watch(_pageIndexController)),
            back: () {
              if (ref.watch(_pageIndexController) == 0) {
                Navigation.goTo(
                  CustomAppRouter.home,
                  removeUntil: true,
                );
              }
              final currentPage = (_controller.page ?? 0).toInt();
              if (currentPage > 0) {
                _controller.animateToPage(
                  currentPage - 1,
                  duration: AppDurations.animation,
                  curve: AppConstants.defaultCurve,
                );
              }
            },
            next: () {
              if (_controller.page == 1) {
                context.pushReplacementNamed(
                    CustomAppRouter.petRegistrationComplete,);
              }
              final currentPage = (_controller.page ?? 0).toInt();
              if (currentPage < pages.length) {
                _controller.animateToPage(
                  currentPage + 1,
                  duration: AppDurations.animation,
                  curve: AppConstants.defaultCurve,
                );
              }
            },
          ),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }

  String _title(index) {
    switch (index) {
      case 0:
        return '¿Qué tipo de mascota tienes?';
      case 1:
        return 'Datos de tu mascota';
      default:
        return '¿Qué especie es tu mascota?';
    }
  }

  String _buttonText(index) {
    switch (index) {
      case 0:
        return 'Omitir';
      case 1:
        return 'Atrás';
      default:
        return 'Atrás';
    }
  }
}
