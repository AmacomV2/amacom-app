// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

/// Type of url resource
// ignore: public_member_api_docs, constant_identifier_names
enum ResourceType { IMAGE, VIDEO, PDF, SVG, UNKNOWN }

/// Given a url resource, returns its type
class ResourceTypeHelper {
  /// Image types
  static final List<String> _imageTypes = [
    'jpg',
    'jpeg',
    'jfif',
    'pjpeg',
    'pjp',
    'png',
    // 'svg',
    'gif',
    'webp',
    'avif',
  ];

  /// Image types
  static final List<String> _svgTypes = ['svg'];

  /// Video types
  static final List<String> _videoTypes = [
    '3g2',
    '3gp',
    'aaf',
    'asf',
    'avchd',
    'avi',
    'drc',
    'flv',
    'm2v',
    'm3u8',
    'm4p',
    'm4v',
    'mkv',
    'mng',
    'mov',
    'mp2',
    'mp4',
    'mpe',
    'mpeg',
    'mpg',
    'mpv',
    'mxf',
    'nsv',
    'ogg',
    'ogv',
    'qt',
    'rm',
    'rmvb',
    'roq',
    'svi',
    'vob',
    'webm',
    'wmv',
    'yuv',
  ];

  /// Return resource type
  static ResourceType getResourceType(String url) {
    try {
      Uri uri = Uri.parse(url);
      String extension = p.extension(uri.path).toLowerCase();
      if (extension.isEmpty) {
        return ResourceType.UNKNOWN;
      }
      if (url.contains('.pdf') || url.contains('.PDF')) {
        return ResourceType.PDF;
      }

      extension = extension.split('.').last;
      if (_imageTypes.contains(extension)) {
        return ResourceType.IMAGE;
      } else if (_videoTypes.contains(extension)) {
        return ResourceType.VIDEO;
      }
    } catch (e) {
      return ResourceType.UNKNOWN;
    }
    return ResourceType.UNKNOWN;
  }

  /// Return resource type
  static ResourceType getType(String url) {
    try {
      String extension = p.extension(url).toLowerCase();
      if (extension.isEmpty) {
        return ResourceType.UNKNOWN;
      }
      if (url.contains('.pdf') || url.contains('.PDF')) {
        return ResourceType.PDF;
      }
      extension = extension.split('.').last;
      if (_imageTypes.contains(extension)) {
        return ResourceType.IMAGE;
      } else if (_videoTypes.contains(extension)) {
        return ResourceType.VIDEO;
      } else if (_svgTypes.contains(extension)) {
        return ResourceType.SVG;
      }
    } catch (e) {
      return ResourceType.UNKNOWN;
    }
    return ResourceType.UNKNOWN;
  }
}
