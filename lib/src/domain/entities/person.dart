import 'package:amacom_app/src/domain/entities/generic_data.dart';

/// Person Entity
///
/// Used to manage persons data fetch from backend
class Person {
  ///
  Person({
    required this.id,
    required this.name,
    required this.documentType,
    required this.documentTypeId,
    required this.gender,
    required this.genderId,
    required this.civilStatus,
    required this.civilStatusId,
    required this.documentNo,
    required this.fullName,
    required this.lastName,
    required this.address,
    required this.occupation,
    required this.birthDay,
    required this.consentText,
    required this.privacyPolicy,
    required this.evaluationCompleted,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// From json map constructor
  factory Person.fromJson(dynamic json) => Person(
        id: json['id'],
        name: json['name'],
        documentType: GenericData.fromJson(json['documentType']),
        documentTypeId: json['documentTypeId'],
        gender: GenericData.fromJson(json['gender']),
        genderId: json['genderId'],
        civilStatus: GenericData.fromJson(json['civilStatus']),
        civilStatusId: json['civilStatusId'],
        documentNo: json['documentNo'],
        fullName: json['fullName'],
        lastName: json['lastName'],
        address: json['address'],
        occupation: json['occupation'],
        birthDay: DateTime.parse(json['birthDay']),
        consentText: json['consentText'],
        privacyPolicy: json['privacyPolicy'],
        evaluationCompleted: json['evaluation_completed'],
        imageUrl: json['imageUrl'] ?? '',
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  /// Person id
  String id;

  /// Person name
  String name;

  /// Person documentType data
  GenericData documentType;

  /// Person documentType UUID
  String documentTypeId;

  /// Person gender data
  GenericData gender;

  /// Person gender UUID
  String genderId;

  /// Person civil status
  GenericData civilStatus;

  /// Person civil status UUID
  String civilStatusId;

  /// Person Document No
  String documentNo;

  /// Person full name
  String fullName;

  /// Person lastName
  String lastName;

  /// Person address
  String? address;

  /// Person occupation
  String? occupation;

  /// Person birthDate
  DateTime birthDay;

  /// Person accepted or not consent text
  bool consentText;

  /// Person accepted privacyPolicy
  bool privacyPolicy;

  /// Person evaluation completed
  bool evaluationCompleted;

  /// Person image URL
  String imageUrl;

  /// Person created date
  String createdAt;

  /// Person updated date
  dynamic updatedAt;
}
