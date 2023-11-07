import 'package:json_annotation/json_annotation.dart';

part 'pageable.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)

/// Manage API responses
///
/// Manage api responses parsing it into an object
class Pageable<T> {
  /// Constructor
  Pageable(
    this.content,
    this.last,
    this.totalPages,
    this.totalElements,
    this.first,
    this.size,
    this.number,
    this.numberOfElements,
    this.empty,
    this.sort,
    this.pageable,
  );

  /// Method to parse API response
  factory Pageable.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageableFromJson(json, fromJsonT);

  /// Bool to know if api request had a server error
  @JsonKey(name: 'last', defaultValue: true)
  final bool last;

  /// Var who contains api request message
  @JsonKey(name: 'totalPages')
  final int totalPages;

  /// Var who contains api request message
  @JsonKey(name: 'totalElements')
  final int totalElements;

  /// Bool to know if api request had a server error
  @JsonKey(name: 'first', defaultValue: true)
  final bool first;

  /// Var who contains api request message
  @JsonKey(name: 'size')
  final int size;

  /// Var who contains api request message
  @JsonKey(name: 'number')
  final int number;

  /// Var who contains api request message
  @JsonKey(name: 'numberOfElements')
  final int numberOfElements;

  ///
  @JsonKey(name: 'empty', defaultValue: true)
  final bool empty;

  ///
  @JsonKey(name: 'sort', fromJson: Sort.fromJson, toJson: Sort.toJsonStatic)
  final Sort sort;

  ///
  @JsonKey(
    name: 'pageable',
    fromJson: PageableData.fromJson,
    toJson: PageableData.toJsonStatic,
  )
  final PageableData pageable;

  /// var who contains api response
  @JsonKey(name: 'content')
  T? content;

  ///  ToJson method
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageableToJson(this, toJsonT);
}

/// Pageable data
class PageableData {
  ///
  PageableData({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });

  ///
  factory PageableData.fromJson(Map<String, dynamic> json) => PageableData(
        sort: Sort.fromJson(json['sort']),
        offset: json['offset'],
        pageSize: json['pageSize'],
        pageNumber: json['pageNumber'],
        paged: json['paged'],
        unpaged: json['unpaged'],
      );

  ///
  Sort sort;

  ///
  int offset;

  ///
  int pageSize;

  ///
  int pageNumber;

  ///
  bool paged;

  ///
  bool unpaged;

  ///
  Map<String, dynamic> toJson() => {
        'sort': sort.toJson(),
        'offset': offset,
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'paged': paged,
        'unpaged': unpaged,
      };

  ///
  static Map<String, dynamic> toJsonStatic(PageableData object) =>
      object.toJson();
}

/// Sort data
class Sort {
  ///
  Sort({
    required this.empty,
    required this.unsorted,
    required this.sorted,
  });

  ///
  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        empty: json['empty'],
        unsorted: json['unsorted'],
        sorted: json['sorted'],
      );

  ///
  bool empty;

  ///
  bool unsorted;

  ///
  bool sorted;

  ///
  Map<String, dynamic> toJson() => {
        'empty': empty,
        'unsorted': unsorted,
        'sorted': sorted,
      };

  ///
  static Map<String, dynamic> toJsonStatic(Sort object) => object.toJson();
}
