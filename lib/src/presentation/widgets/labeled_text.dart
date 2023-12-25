import 'package:amacom_app/src/presentation/widgets/column_with_padding.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:flutter/material.dart';

///
class LabeledText extends StatefulWidget {
  ///
  const LabeledText({super.key, required this.label, required this.text});

  ///
  final String label;

  ///
  final String text;

  @override
  State<LabeledText> createState() => _LabeledTextState();
}

class _LabeledTextState extends State<LabeledText> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ColumnWithPadding(
      padding: EdgeInsets.zero,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 2,
              left: 8,
              right: 8,
              bottom: 2,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: AnimatedContainer(
                duration: AppDurations.animation,
                height: expanded ? 110 : 55,
                width: double.infinity,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Text(
                      widget.text,
                      maxLines: 20,
                      style: textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
