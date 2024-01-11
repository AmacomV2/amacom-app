import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Pet information form
///
/// Catch information about user's pet
class PrivacyPolitics extends StatelessWidget {
  /// Widget Constructor
  const PrivacyPolitics({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar2(
            title: appLocalizations?.privacyPolicy,
            padding: true,
          ),
          Expanded(
            child: ScrollColumnExpandable(
              padding: responsive.appHorizontalPadding,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FigmaColors.primary_50,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.bodyContainersRadius),
                      topRight: Radius.circular(AppSizes.bodyContainersRadius),
                    ),
                  ),
                  padding: responsive.allMaxPadding(16),
                  child: Row(
                    children: [
                      CloseIconButton(
                        backgroundColor: FigmaColors.primary_100,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                      const HorizontalSpacer(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          'www.amacomApp.com/politicadeprivacidad.co',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ColumnWithPadding(
                    padding: responsive.appHInnerPadding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SafeSpacer(
                        height: 18,
                      ),
                      Text(
                        'Términos y condiciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SafeSpacer(
                        height: 10,
                      ),
                      Text(
                        '''These Terms of Service (“ Terms ”) are a binding legal agreement between you and Airbnb governing your right to use Airbnb's websites, apps and other offerings (collectively, the “ Airbnb Platform ”). When these Terms use “ Airbnb ,” “ we ,” “ us , ” or “ our ,” they mean the Airbnb entity listed in Exhibit 1 with whom you contract. \n\nThe Airbnb Platform provides an online site that allows users (“ Members ”) to post, offer, search and book services. Members who post and offer services are “ Hosts ”, while members who search for, book or use services are “ Guests ”. Hosts offer accommodations (“ Accommodations ”), activities, excursions and events (“ Experiences ”), as well as a variety of travel and other services (collectively, the “ Host Services ”, and each offering of a Host Service Host a “ Announcement”). You must register an account to access and use many features of the Airbnb Platform, as well as keep your account information accurate. As the provider of the Airbnb Platform, Airbnb does not own, control, offer or administer any Listings, Host Services or tour services. Airbnb is not a party to contracts directly between Hosts and Guests, nor is it a real estate agent, travel agency or insurer. Airbnb is not acting as an agent for any Member, except as specified in the Payments Terms of Service (“ Payments Terms ”). For more information about the Airbnb feature, see Section 16.
                We maintain other terms and policies that supplement these Terms, such as the Privacy Policy , which describes the collection and use of personal data, and the Payment Terms , which govern the payment services provided to Members by Airbnb payment entities. (collectively, "Airbnb Payments ").
                
                These Terms of Service (“ Terms ”) are a binding legal agreement between you and Airbnb governing your right to use Airbnb's websites, apps and other offerings (collectively, the “ Airbnb Platform ”). When these Terms use “ Airbnb ,” “ we ,” “ us , ” or “ our ,” they mean the Airbnb entity listed in Exhibit 1 with whom you contract.
                The Airbnb Platform provides an online site that allows users (“ Members ”) to post, offer, search and book services. Members who post and offer services are “ Hosts ”, while members who search for, book or use services are “ Guests ”. Hosts offer accommodations (“ Accommodations ”), activities, excursions and events (“ Experiences ”), as well as a variety of travel and other services (collectively, the “ Host Services ”, and each offering of a Host Service Host a “ Announcement”). You must register an account to access and use many features of the Airbnb Platform, as well as keep your account information accurate. As the provider of the Airbnb Platform, Airbnb does not own, control, offer or administer any Listings, Host Services or tour services. Airbnb is not a party to contracts directly between Hosts and Guests, nor is it a real estate agent, travel agency or insurer. Airbnb is not acting as an agent for any Member, except as specified in the Payments Terms of Service (“ Payments Terms ”). For more information about the Airbnb feature, see Section 16.
                We maintain other terms and policies that supplement these Terms, such as the Privacy Policy , which describes the collection and use of personal data, and the Payment Terms , which govern the payment services provided to Members by Airbnb payment entities. (collectively, "Airbnb Payments ").v
                      ''',
                        textAlign: TextAlign.left,
                      ),
                      BottomSpacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
