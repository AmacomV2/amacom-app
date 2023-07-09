import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

/// Class to manage all app url resources like images and stuff like that
class AppUrlResources {
  /// App terms and conditions url
  static const termsAndConditions =
      'https://rewindrecursos.s3.amazonaws.com/REWIND+-+Te%CC%81rminos+y+Condiciones.pdf';

  /// App terms and conditions url
  static const privacyPolicy =
      'https://rewindrecursos.s3.amazonaws.com/REWIND+-+Poli%CC%81tica+de+Proteccion+de+Datos+Personales.pdf';

  /// App landing url
  static const landingUrl = 'https://www.rewindmovement.com/';

  /// App landing url
  static const facebookUrl = 'https://www.facebook.com/rewindvidasostenible';

  /// App landing url
  static const instagramUrl =
      'https://www.instagram.com/rewind_vidasostenible/';

  /// App map url
  static const humanMap = 'https://rewind.datahuman.io/';

  /// Launch a given url
  static Future<void> launchGivenUrl(
    String url, {
    LaunchMode? launchMode,
  }) async {
    launchMode =
        isApple ? LaunchMode.platformDefault : LaunchMode.externalApplication;
    if (!await launchUrl(
      Uri.parse(
        url,
      ),
      mode: launchMode,
    )) {
      throw 'Could not launch given url';
    }
  }
}
