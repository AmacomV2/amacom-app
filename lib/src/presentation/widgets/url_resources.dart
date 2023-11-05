import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';

/// Tip resource
///
/// Show tip resource image or video
class UrlResource extends StatefulWidget {
  /// Constructor
  const UrlResource({
    super.key,
    required this.recourseUrl,
    this.playIndicatorSize = 35,
    this.fit,
  });

  /// Recourse url
  final String recourseUrl;

  /// Play indicator size
  final double playIndicatorSize;

  /// BoxFit to apply on element
  final BoxFit? fit;

  @override
  State<UrlResource> createState() => _UrlResourceState();
}

class _UrlResourceState extends State<UrlResource> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final resourceType = ResourceTypeHelper.getType(widget.recourseUrl);
    if (resourceType == ResourceType.VIDEO) {
      _controller = VideoPlayerController.network(widget.recourseUrl)
        ..initialize().then(
          (_) {
            setState(() {}); //when your thumbnail will show.
          },
        );
      _controller?.setVolume(1.0);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resourceType = ResourceTypeHelper.getType(widget.recourseUrl);
    final responsive = ResponsiveDesign(context);
    if (resourceType == ResourceType.IMAGE) {
      return CachedNetworkImage(
        imageUrl: widget.recourseUrl,
        memCacheWidth: responsive.screenWidth.toInt(),
        fit: widget.fit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) =>
            CustomCircularProgressIndicator(
          strokeWidth: 3,
          headRadius: 3.5,
          value: progress.progress,
        ),
      );
    }

    if (resourceType == ResourceType.PDF) {
      return SizedBox(
        height: responsive.screenWidth,
        child: SfPdfViewer.network(
          widget.recourseUrl.trim(),
        ),
      );
    }
    if (resourceType == ResourceType.VIDEO) {
      final indicatorSize = responsive.safeHeight(widget.playIndicatorSize);
      return InkWell(
        onTap: () {
          setState(() {
            (_controller?.value.isPlaying ?? false)
                ? _controller?.pause()
                : _controller?.play();
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : const SizedCustomProgressIndicator(
                    color: Colors.white,
                  ),
            if (!_controller!.value.isPlaying)
              Container(
                height: indicatorSize,
                width: indicatorSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    indicatorSize * 2,
                  ),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: indicatorSize * 0.8,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      );
    }
    return Container();
  }
}

/// Widget to display url in an entire screen view
class NetworkResourceView extends StatelessWidget {
  /// Constructor
  const NetworkResourceView({
    super.key,
    this.url,
    this.title,
  });

  /// Resource url
  final String? url;

  /// Optional title
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      body: ColumnWithPadding(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            centerTitle: true,
            title: title,
            onBack: () => Navigator.of(context).pop(),
          ),
          if ((url ?? arguments['url']) != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => AppUrlResources.launchGivenUrl(url ?? ''),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: 15,
                            color: theme.colorScheme.primaryContainer,
                          ),
                          const HorizontalSpacer(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              url ?? '',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SafeSpacer(),
                  Expanded(
                    child: UrlResource(recourseUrl: url ?? arguments['url']),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
