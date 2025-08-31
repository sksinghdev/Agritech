import '../../domain/entities/crop.dart';

class CropModel {
  final int id;
  final String name;
  final String thumbnail;
  final String details;

  const CropModel(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.details});

  factory CropModel.fromJson(Map<String, dynamic> json) => CropModel(
        id: json['id'] as int,
        name: json['name'] as String,
        thumbnail: json['thumbnail'] as String,
        details: json['details'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail': thumbnail,
        'details': details,
      };

  Crop toEntity() =>
      Crop(id: id, name: name, thumbnail: thumbnail, details: details);

  static List<Crop> listFromJson(Map<String, dynamic> json) {
    final list = (json['crops'] as List).cast<Map<String, dynamic>>();
    return list.map((e) => CropModel.fromJson(e).toEntity()).toList();
  }
}
