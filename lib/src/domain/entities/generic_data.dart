import 'package:amacom_app/src/utils/extensions/color_hex_extension.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Class used to manage generic data
class GenericData {
  ///
  GenericData({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  /// From raw json constructor
  factory GenericData.fromJson(Map json) => GenericData(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        color: json['color'] != null ? HexColor.fromHex(json['color']) : null,
        imageUrl: json['imageUrl'] ?? json['imageURL'],
        createdAt: DateTime.parse(json['createdAt'] ?? ''),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      );

  /// From raw json constructor
  static GenericData? tryFromJson(dynamic json) {
    try {
      return GenericData(
        id: json?['id'],
        name: json?['name'],
        description: json?['description'],
        imageUrl: json['imageUrl'],
        color: json['color'] != null ? HexColor.fromHex(json['color']) : null,
        createdAt: DateTime.parse(json?['createdAt'] ?? ''),
        updatedAt: DateTime.tryParse(json?['updatedAt'] ?? ''),
      );
    } catch (e) {
      return null;
    }
  }

  /// UUID for entity
  String id;

  /// Entity name
  String name;

  /// Entity optional description
  String? description;

  /// Entity optional image
  String? imageUrl;

  /// Entity creationDate
  DateTime createdAt;

  /// Entity optional property
  Color? color;

  /// Entity updatedDate
  DateTime? updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<GenericData> fromJsonList(dynamic data) {
    final List<GenericData> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(GenericData.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }
    return result;
  }
}
