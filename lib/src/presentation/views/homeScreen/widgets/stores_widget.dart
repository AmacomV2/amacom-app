import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// Stores H-list widget
class Stores extends StatelessWidget {
  ///
  const Stores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 10)),
          lastDate: DateTime(2025, 11, 20),
          onDateSelected: (date) => log(date),
          leftMargin: 20,
          dayColor: FigmaColors.primary_200,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: FigmaColors.primary_50,
          dotsColor: FigmaColors.primary_100,
          selectableDayPredicate: (date) => date.day != 23,
        ),
        const SafeSpacer(),
        const Text(
          'Novedades',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SafeSpacer(),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _StoreItem(
                storeTitle: 'Pet Shop',
                storeAddress: 'Cra 8# 7ma - 155',
                storeCashback: '3% Cashback',
                color: Colors.green.shade200,
                painterColor: Colors.green,
                pathImage: 'assets/png/icons/1_pet.png',
              ),
              _StoreItem(
                storeTitle: 'Puppis',
                storeAddress: 'Cra 8# 7ma - 155',
                storeCashback: '8% Cashback',
                color: Colors.amber.shade200,
                painterColor: Colors.amber,
                pathImage: 'assets/png/icons/2_pet.png',
              ),
              _StoreItem(
                storeTitle: 'Can y felix',
                storeAddress: 'Cra 8# 7ma - 155',
                storeCashback: '5% Cashback',
                color: Colors.red.shade200,
                painterColor: Colors.red,
                pathImage: 'assets/png/icons/3_pet.png',
              ),
              _StoreItem(
                storeTitle: 'Animales shop',
                storeAddress: 'Cra 8# 7ma - 155',
                storeCashback: '8% Cashback',
                color: Colors.purple.shade200,
                painterColor: Colors.purple,
                pathImage: 'assets/png/icons/4_pet.png',
              ),
              _StoreItem(
                storeTitle: 'Caninos vet',
                storeAddress: 'Cra 8# 7ma - 155',
                storeCashback: '8% Cashback',
                color: Colors.blue.shade200,
                painterColor: Colors.blue,
                pathImage: 'assets/png/icons/5_pet.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoreItem extends StatelessWidget {
  const _StoreItem({
    this.color = Colors.red,
    this.painterColor = Colors.red,
    required this.pathImage,
    required this.storeTitle,
    required this.storeAddress,
    required this.storeCashback,
  });
  final Color color;
  final Color painterColor;
  final String pathImage;
  final String storeTitle;
  final String storeAddress;
  final String storeCashback;

  @override
  Widget build(BuildContext context) {
    final responsiveD = GlobalLocator.responsiveDesign;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: responsiveD.maxWidthValue(10)),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          width: 194,
          height: 117,
          child: CustomPaint(
            painter: _CustomPainterPicture(color: painterColor),
          ),
        ),
        _DataContainer(
          pathImage: pathImage,
          storeTitle: storeTitle,
          storeAddress: storeAddress,
          storeCashback: storeCashback,
          color: painterColor,
        ),
      ],
    );
  }
}

class _DataContainer extends StatelessWidget {
  const _DataContainer({
    required this.pathImage,
    required this.storeTitle,
    required this.storeAddress,
    required this.storeCashback,
    required this.color,
  });

  ///
  final String pathImage;
  final String storeTitle;
  final String storeAddress;
  final String storeCashback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final responsiveD = GlobalLocator.responsiveDesign;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveD.maxWidthValue(10)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: 194,
      height: 117,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                storeTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                storeAddress,
                style: const TextStyle(fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  storeCashback,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:
                EdgeInsets.only(top: 18, right: responsiveD.maxWidthValue(20)),
            child: CustomAssetIcon(path: pathImage, height: 100, width: 75),
          ),
        ],
      ),
    );
  }
}

class _CustomPainterPicture extends CustomPainter {
  _CustomPainterPicture({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();

    path.moveTo(size.width * 0.6, 0);
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.10,
      size.width * 0.5,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.5,
      size.width * 0.6,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.6,
      size.width * 0.65,
      size.height,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height,
      size.width * 0.85,
      size.height,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.8,
      size.width * 0.8,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.3,
      size.width * 0.6,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
