import 'package:amacom_app/src/domain/entities/situations.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class SituationCard extends StatelessWidget {
  ///
  const SituationCard({
    super.key,
    required this.data,
  });

  /// Situation basic data
  final SituationEntity data;

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.maxWidthValue(10),
        vertical: responsive.maxHeightValue(8),
      ),
      color: Colors.blue,
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(''),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
