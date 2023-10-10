import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//// Add pet banner
///
///Widget shown on add pet message in home screen
class BannerAddPet extends StatelessWidget {
  ////
  const BannerAddPet({
    super.key,
    this.hasPets = false,
  });

  /// To load a different view if user has no pets
  final bool hasPets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeSpacer(),
        Stack(
          children: [
            Container(
              width: 396,
              height: 197,
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7CABF9),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 167,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    left: 14.0,
                    right: 150,
                    bottom: 14.0,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '¿Tienes una nueva \nmascota?',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                {context.pushNamed('/petRegistration')},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffEBF1FF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              width: 150,
                              height: 48,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Registra aquí',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff3377FF),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
                                    color: Color(0xff3377FF),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 170),
              child: CustomAssetIcon(
                path: (hasPets)
                    ? 'assets/images/home_addPet.png'
                    : 'assets/png/banners/without_pets.png',
                height: 198,
                width: 198,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
