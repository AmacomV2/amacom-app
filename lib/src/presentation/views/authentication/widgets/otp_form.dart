import 'package:amacom_app/src/presentation/state/authentication/code_validation_provider.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// OTP code input
class OTPVerificationForm extends ConsumerWidget {
  /// Widget constructor
  const OTPVerificationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
      borderSide: BorderSide(
        color: theme.primaryColor,
      ),
    );
    return Theme(
      data: theme.copyWith(
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          enabledBorder: border,
          errorBorder: border,
          focusedBorder: border,
        ),
      ),
      child: _CustomOTPTextField(
        pinLength: 4,
        onChanged: (value) {
          ref
              .read(codeValidationProvider.notifier)
              .update((state) => state = value);
        },
        onCompleted: (value) {},
        showUnderline: false,
        textStyle: theme.textTheme.headlineMedium,
        fieldWidth: 70,
        decoration: InputDecoration(
          hintMaxLines: null,
          border: border,
          counter: const Offstage(),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
        ),
      ),
    );
  }
}

/// Password recovering OTP code input
class OTPPasswordResetForm extends StatelessWidget {
  /// Widget constructor
  const OTPPasswordResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        _CustomOTPTextField(
          pinLength: 4,
          onChanged: (value) {},
          onCompleted: (value) {},
          showUnderline: false,
          textStyle: theme.textTheme.headlineMedium,
          fieldWidth: 65,
          decoration: const InputDecoration(
            counter: Offstage(),
            hintMaxLines: null,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class _CustomOTPTextField extends StatefulWidget {
  const _CustomOTPTextField({
    this.fieldWidth = 40,
    this.showUnderline = false,
    this.decoration,
    this.textStyle,
    this.onChanged,
    this.onCompleted,
    this.pinLength = 4,
  });
  final int pinLength;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;

  final bool showUnderline;
  final InputDecoration? decoration;

  final double fieldWidth;
  final TextStyle? textStyle;

  @override
  _CustomOTPTextFieldState createState() => _CustomOTPTextFieldState();
}

class _CustomOTPTextFieldState extends State<_CustomOTPTextField> {
  List<OTPLengthModel> list = [];
  FocusNode focusNode = FocusNode();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    list.addAll(
      List.generate(widget.pinLength, (index) {
        return OTPLengthModel(
          textEditingController: TextEditingController(),
          focusNode: FocusNode(),
        );
      }).toList(),
    );
  }

  String get concatText {
    String text = '';

    for (var element in list) {
      if (text.isEmpty) {
        text = element.textEditingController!.text;
      } else {
        text = '$text${element.textEditingController!.text}';
      }
    }

    return text;
  }

  void moveToNextFocus(int index) async {
    if (index == (list.length - 1)) {
      widget.onCompleted?.call(concatText);
    } else {
      context.unFocus(list[index].focusNode!);
      context.requestFocus(list[index + 1].focusNode!);

      setTextSelection(index + 1);
    }
  }

  void moveToPreviousFocus(int index) async {
    if (index >= 1) {
      context.unFocus(list[index].focusNode!);
      context.requestFocus(list[index - 1].focusNode!);

      setTextSelection(index - 1);
    } else {
      context.unFocus(list[index].focusNode!);
      context.requestFocus(list[0].focusNode!);

      setTextSelection(0);
    }
  }

  void setTextSelection(int index) {
    currentIndex = index;

    list[index].textEditingController!.selection = TextSelection(
      baseOffset: 0,
      extentOffset: list[index].textEditingController!.text.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in list) {
      element.textEditingController?.dispose();
      element.focusNode?.dispose();
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(list.length, (index) {
        return Container(
          width: widget.fieldWidth,
          margin: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: radius(),
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: list[index].textEditingController,
            focusNode: list[index].focusNode,
            keyboardType: TextInputType.number,
            style: widget.textStyle,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            maxLength: 1,
            decoration: widget.decoration ??
                InputDecoration(
                  border: widget.showUnderline ? null : InputBorder.none,
                  counter: const Offstage(),
                  contentPadding: EdgeInsets.zero,
                ),
            textAlign: TextAlign.center,
            onSubmitted: (s) {
              if (s.isEmpty) {
                moveToPreviousFocus(index);
              } else if (s.length == 1) {
                moveToNextFocus(index);
              }
            },
            onChanged: (s) {
              if (s.isEmpty) {
                moveToPreviousFocus(index);
              } else if (s.length == 1) {
                moveToNextFocus(index);
              }
              widget.onChanged?.call(concatText);

              setState(() {});
            },
            onTap: () async {
              context.unFocus(list[index].focusNode!);
              await 1.milliseconds.delay;
              if (context.mounted) {
                context.requestFocus(list[index].focusNode!);
              }

              setTextSelection(index);
            },
          ),
        );
      }),
    );
  }
}
