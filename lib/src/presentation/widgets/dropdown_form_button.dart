import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/custom_text_form_fields.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// DropDown input
///
/// Shows a drop down input selector with given options
class CustomDropDownFrom extends StatelessWidget {
  /// Widget constructor
  const CustomDropDownFrom({
    super.key,
    required this.items,
    required this.onChanged,
    this.validator,
    this.hintText,
    this.labelText,
    this.controller,
    this.initialValue,
    this.value,
    this.label,
    this.showRequiredIndicator = false,
    this.suffixIcon,
  });

  /// On value change callback
  final Function(dynamic) onChanged;

  /// To show or not required indicator
  final bool showRequiredIndicator;

  /// Items to show
  final List<DropdownMenuItem<Object?>>? items;

  /// TextFormField validation function
  final String? Function(dynamic)? validator;

  /// TextFormField label text
  final String? labelText;

  /// TextFormField label text
  final Widget? label;

  /// TextFormField label text
  final Widget? suffixIcon;

  /// TextFormField hint text
  final String? hintText;

  /// Current value
  final Object? value;

  /// TextFormField initial value, if specified then controller won't will be assign
  /// to TextFromField
  final String? initialValue;

  /// TextFormField controller, if specified then initial value won't will be assign
  /// to TextFromField
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return DropdownButtonFormField(
      value: value,
      items: items,
      borderRadius: BorderRadius.circular(AppSizes.inputsBorderRadius),
      dropdownColor: colorScheme.background,
      validator: validator,
      onChanged: onChanged,
      style: theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        suffixIcon: suffixIcon,
        labelText: showRequiredIndicator ? null : labelText,
        labelStyle: theme.textTheme.bodyLarge,
        label: showRequiredIndicator
            ? (label ??
                (labelText != null
                    ? LabelRequired(
                        label: labelText!,
                        required: showRequiredIndicator,
                      )
                    : null))
            : null,
      ),
    );
  }
}
