import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/main_screen_search.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_card.dart';
import 'package:amacom_app/src/presentation/widgets/circular_progress_indicator.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationsBody extends ConsumerWidget {
  ///
  const SituationsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;

    return CustomBody(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: responsive.screenWidth,
        child: Column(
          children: [
            const MainScreenSearch(),
            const Divider(
              thickness: 1.2,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () async {
                    final t = ref.refresh(situationsListProvider);
                    GlobalLocator.appLogger.i(
                      'Refreshed situations list provider: ${t.valueOrNull?.length}',
                    );
                  },
                  child: ref.watch(situationsListProvider).when(
                        data: (data) {
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: data.length,
                            separatorBuilder: (context, index) => const Divider(
                              thickness: 0.5,
                            ),
                            itemBuilder: (context, index) {
                              return SituationCard(
                                data: data[index],
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return ErrorWidget(error);
                        },
                        loading: () => const SizedCustomProgressIndicator(),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
