import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// Loads local data like shared preferences,
/// image from device and more
class LocalDataSource {
  /// Constructor
  LocalDataSource() {
    _picker = ImagePicker();
  }
  late ImagePicker _picker;

  /// Load image from gallery
  Future<File?> getGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if ((image?.path ?? '').isNotEmpty) return File(image!.path);
    return null;
  }

  /// Load image from gallery
  Future<File?> getGalleryVideo() async {
    XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
    if ((image?.path ?? '').isNotEmpty) return File(image!.path);
    return null;
  }

  /// Load image from camera
  Future<File?> getCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if ((image?.path ?? '').isNotEmpty) return File(image!.path);
    return null;
  }

  /// Load image from camera
  Future<File?> getCameraVideo() async {
    XFile? image = await _picker.pickVideo(source: ImageSource.camera);
    if ((image?.path ?? '').isNotEmpty) return File(image!.path);
    return null;
  }
}

/// Local dataSource Riverpod provider
final localDataSourceProvider = Provider.autoDispose<LocalDataSource>(
  (ref) => LocalDataSource(),
);
