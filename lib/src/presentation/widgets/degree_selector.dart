import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

///
class DegreeSelector extends ConsumerWidget {
  ///
  const DegreeSelector({
    super.key,
    required this.stateProvider,
    this.maxValue = 10,
  });

  /// Widget state
  final StateProvider<int?> stateProvider;

  /// Max value selection
  final int maxValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        maxValue,
        (index) {
          Color? color;
          if (index < maxValue / 2) {
            color = Color.lerp(
              FigmaColors.success_400,
              FigmaColors.warning_600,
              ((index) / maxValue) + 0.4,
            );
          } else {
            color = Color.lerp(
              FigmaColors.warning_600,
              FigmaColors.danger_400,
              ((index) / (maxValue / 2)) - 0.2,
            );
          }
          return Column(
            children: [
              _Element(
                state: (ref.watch(stateProvider) ?? -1) >= index,
                color: color!,
                onTap: () {
                  ref.read(stateProvider.notifier).update(
                        (state) => state = index,
                      );
                },
              ),
              const SafeSpacer(
                height: 5,
              ),
              Text('${index + 1}'),
            ],
          );
        },
      ),
    );
  }
}

///
class DegreeSelectorReverse extends StatefulWidget {
  ///
  const DegreeSelectorReverse({
    super.key,
    required this.onChanged,
    this.maxValue = 3,
    this.initialValue = 0,
  });

  /// Widget state
  final Function(int) onChanged;

  /// Max value selection
  final int maxValue;

  /// Max value selection
  final int initialValue;

  @override
  State<DegreeSelectorReverse> createState() => _DegreeSelectorReverseState();
}

class _DegreeSelectorReverseState extends State<DegreeSelectorReverse> {
  int currentValue = 0;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        widget.maxValue,
        (index) {
          Color? color;
          if (index < widget.maxValue / 2) {
            color = Color.lerp(
              FigmaColors.warning_600,
              FigmaColors.success_400,
              ((index) / widget.maxValue) + 0.4,
            );
          } else {
            color = Color.lerp(
              FigmaColors.danger_400,
              FigmaColors.warning_600,
              ((index) / (widget.maxValue / 2)) - 0.2,
            );
          }
          return Column(
            children: [
              _Element(
                state: currentValue >= index + 1,
                color: color!,
                onTap: () {
                  if (currentValue != index + 1) {
                    widget.onChanged(index + 1);
                  }
                  currentValue = index + 1;
                  setState(() {});
                },
              ),
              const SafeSpacer(
                height: 2,
              ),
              Text('${index + 1}'),
            ],
          ).paddingRight(10);
        },
      ),
    );
  }
}

class _Element extends StatelessWidget {
  const _Element({
    required this.state,
    required this.color,
    required this.onTap,
  });

  final bool state;

  final Color color;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: state
            ? Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : null,
      ),
    );
  }
}
