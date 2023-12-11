import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Password recover screen
///
/// Ask for email and send a recover OTP
class PasswordRecoverScreen extends ConsumerStatefulWidget {
  /// Constructor
  const PasswordRecoverScreen({super.key});

  @override
  ConsumerState<PasswordRecoverScreen> createState() =>
      _PasswordRecoverScreenState();
}

class _PasswordRecoverScreenState extends ConsumerState<PasswordRecoverScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      ref
          .read(passRecoveringIndexProvider.notifier)
          .update((state) => _pageController.page?.toInt() ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      RecoverPasswordForm(
        onSuccess: () {
          _pageController.animateToPage(
            1,
            duration: AppDurations.animation,
            curve: AppConstants.defaultCurve,
          );
        },
      ),
      PasswordOTPVerificationForm(
        onSuccess: () {
          _pageController.animateToPage(
            2,
            duration: AppDurations.animation,
            curve: AppConstants.defaultCurve,
          );
        },
      ),
      NewPasswordForm(
        onSuccess: () {
          Navigation.goBack();
        },
      ),
    ];

    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: ColumnWithPadding(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar2(
            title: appLocalizations?.recoverYourPassword ?? '',
            subtitle: appLocalizations?.recoverYourPasswordText ?? '',
          ),
          Expanded(
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          PageProgressIndicator(
            pageController: _pageController,
            totalPages: 3,
            currentPage: ref.watch(passRecoveringIndexProvider),
          ),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
