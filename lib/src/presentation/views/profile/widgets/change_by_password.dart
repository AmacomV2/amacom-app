import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Pet information form
///
/// Catch information about user's pet
class ChangePasswordByForm extends StatelessWidget {
  /// Widget Constructor
  const ChangePasswordByForm({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: 'Cambiar contraseña',
            centerTitle: true,
            padding: true,
          ),
          const Expanded(
            child: CustomBody(
              child: ScrollColumnExpandable(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SafeSpacer(),
                  Text(
                    'Te enviaremos un correo electrónico con la nueva contraseña asignada a tu cuenta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SafeSpacer(
                    height: 32,
                  ),
                  CustomTextFormField(
                    labelText: 'Contraseña actual',
                    hintText: 'Escribe tu contraseña actual',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SafeSpacer(
                    height: 16,
                  ),
                  CustomTextFormField(
                    labelText: 'Nueva contraseña',
                    hintText: 'Escribe tu nueva contraseña',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SafeSpacer(
                    height: 16,
                  ),
                  CustomTextFormField(
                    labelText: 'Confirmar contraseña',
                    hintText: 'Escribe aqui tu contraseña',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SafeSpacer(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomButtonWithState(
            onTap: () {},
            text: 'Guardar',
            margin: responsive.appHorizontalPadding,
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }
}
