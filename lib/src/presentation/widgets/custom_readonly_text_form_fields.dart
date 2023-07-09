import 'package:flutter/material.dart';

/// Custom TexFormField used commonly on app
class CustomReadonlyTextFormField extends StatelessWidget {
  /// Constructor
  const CustomReadonlyTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.obscureText,
    this.suffixIcon,
    this.textCapitalization,
    this.label,
    this.showRequiredIndicator = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  });

  ///
  final FloatingLabelBehavior floatingLabelBehavior;

  /// TextFormField label text
  final String? labelText;

  /// TextFormField hint text
  final String? hintText;

  /// To show or not required indicator
  final bool showRequiredIndicator;

  /// Min lines to show on TextFormField
  final int? minLines;

  /// Max Lines on TextFormField, it will resize to the current No of lines if < maxLines
  final int? maxLines;

  /// Hide or show text
  final bool? obscureText;

  /// Optional text capitalization, by default [TextCapitalization.words]
  final TextCapitalization? textCapitalization;

  /// Suffix widget
  final Widget? suffixIcon;

  /// Label widget
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: 63,
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: hintText != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hintText!,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 3),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
