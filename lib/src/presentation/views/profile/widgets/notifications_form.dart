import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Pet information form
///
/// Catch information about user's pet
class NotificationsForm extends StatelessWidget {
  /// Widget Constructor
  const NotificationsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final height = responsive.maxHeightValue(72);
    final List<Map<String, dynamic>> options = [
      {
        'name': 'Notificaciones de eventos',
        'selected': false,
      },
      {
        'name': 'Notificaciones de situaciones',
        'selected': true,
      },
    ];
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: 'Notificaciones',
            centerTitle: true,
            padding: true,
          ),
          Expanded(
            child: CustomBody(
              padding: responsive.appHorizontalPadding
                  .copyWith(top: responsive.maxHeightValue(24)),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return _CustomCupertinoSwitch(
                    title: options[index]['name'],
                    value: options[index]['selected'],
                    height: height,
                    onChanged: (value) {},
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: responsive.maxHeightValue(31),
                ),
                itemCount: options.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCupertinoSwitch extends StatelessWidget {
  const _CustomCupertinoSwitch({
    required this.title,
    required this.value,
    required this.height,
    this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool)? onChanged;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          CupertinoSwitch(
            activeColor: Colors.blue,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
