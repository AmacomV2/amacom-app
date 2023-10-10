import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:flutter/material.dart';

/// Pet status
///
/// Widget to show current pet status
class PetFeelings extends StatelessWidget {
  ///
  const PetFeelings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeSpacer(),
        Text(
          'Tus mascotas se encuentran',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SafeSpacer(),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _FeelingPetItem(
                colorBackgroundPercent: FigmaColors.danger_50,
                percent: 10,
                colorPercent: FigmaColors.danger_400,
                labelFeel: 'Muy triste',
                petName: 'Donatello',
                feelImage: '1_feel.png',
              ),
              Divider(),
              _FeelingPetItem(
                colorBackgroundPercent: FigmaColors.warning_100,
                percent: 50,
                colorPercent: FigmaColors.warning_600,
                labelFeel: 'Triste',
                petName: 'Sasha',
                feelImage: '2_feel.png',
              ),
              Divider(),
              _FeelingPetItem(
                colorBackgroundPercent: FigmaColors.success_50,
                percent: 100,
                colorPercent: FigmaColors.success_400,
                labelFeel: 'Feliz',
                petName: 'Pet',
                feelImage: '3_feel.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeelingPetItem extends StatelessWidget {
  const _FeelingPetItem({
    required this.colorPercent,
    required this.percent,
    required this.colorBackgroundPercent,
    required this.petName,
    required this.labelFeel,
    required this.feelImage,
  });
  final Color colorPercent;
  final double percent;
  final Color colorBackgroundPercent;
  final String petName;
  final String labelFeel;
  final String feelImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xff8FB5F5),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: CustomAssetIcon(
              path: 'assets/png/icons/$feelImage',
              height: 48,
              width: 48,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$petName se siente',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff3377FF),
                      ),
                    ),
                    Text(
                      labelFeel,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SafeSpacer(
                height: 10,
              ),
              _LinearProgressIndicator(
                lineColor: colorBackgroundPercent,
                percent: percent,
                percentColor: colorPercent,
              ),
              const SafeSpacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinearProgressIndicator extends StatefulWidget {
  const _LinearProgressIndicator({
    required this.lineColor,
    required this.percentColor,
    required this.percent,
  });
  final Color lineColor;
  final double percent;
  final Color percentColor;

  @override
  State<_LinearProgressIndicator> createState() =>
      _LinearProgressIndicatorState();
}

class _LinearProgressIndicatorState extends State<_LinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.lineColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 10,
      width: 280,
      child: CustomPaint(
        painter: _LinearIndicator(
          percent: widget.percent,
          percentColor: widget.percentColor,
        ),
      ),
    );
  }
}

class _LinearIndicator extends CustomPainter {
  _LinearIndicator({required this.percent, required this.percentColor});

  final double percent;
  final Color percentColor;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = percentColor
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final percentage = (percent / 100);
    Offset p1 = Offset(0, size.height / 2);
    Offset p2 = Offset(size.width * percentage, size.height / 2);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
