import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class ConnectivityController {
  ///
  ValueNotifier<bool> isConnected = ValueNotifier(false);

  ///
  Future<void> init() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    await AppDurations.retryDelayFuture();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isInternetConnected(result);
    });
  }

  ///
  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}

///
class ConnectionAlert extends StatefulWidget {
  ///
  const ConnectionAlert({super.key});
  @override
  State<ConnectionAlert> createState() => _ConnectionAlertState();
}

class _ConnectionAlertState extends State<ConnectionAlert> {
  ConnectivityController connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: connectivityController.isConnected,
      builder: (context, value, child) {
        if (value) {
          return FadeOut(
            duration: AppDurations.longAnimation,
            animate: true,
            key: UniqueKey(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.wifi,
                size: 26,
                color: FigmaColors.success_400,
              ),
            ),
          );
        } else {
          return ShakeX(
            key: UniqueKey(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.wifi_off_rounded,
                size: 26,
                color: FigmaColors.danger_400,
              ),
            ),
          );
        }
      },
    );
  }
}
