import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/login_form.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class LoginScreen extends StatelessWidget {
  ///
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const LoginBody(),
      web: Row(
        children: [
          SizedBox(
            width: GlobalLocator.responsiveDesign.maxWidthValue(500),
            child: const LoginBody(
              web: true,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/web/login.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

///
class LoginBody extends StatelessWidget {
  ///
  const LoginBody({super.key, this.web = false});

  ///
  final bool web;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: ColumnWithPadding(
        children: [
          HeaderSpacer(
            height: web ? 60 : 32,
          ),
          Image.asset(
            'assets/images/login.png',
            height: GlobalLocator.responsiveDesign.maxHeightValue(
              260,
            ),
          ),
          const SafeSpacer(
            height: 4,
          ),
          CustomAppBar2(
            title: appLocalizations?.logIn ?? '',
            subtitle: appLocalizations?.logInText ?? '',
            prefix: const SizedBox(),
            onTop: false,
          ),
          const Expanded(child: LoginForm()),
          const GoToRegistration(),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
