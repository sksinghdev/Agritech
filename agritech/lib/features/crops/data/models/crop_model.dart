import '../../domain/entities/crop.dart';

class CropModel {
  final int id;
  final String name;
  final String thumbnail;
  final String details;
  final String season;
  final String soilType;
  final String waterRequirement;
  final String harvestTime;
  final List<String> nutrients;
  final int pricePerQuintal;
  final String origin;
  final String duration;

  const CropModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.details,
    required this.season,
    required this.soilType,
    required this.waterRequirement,
    required this.harvestTime,
    required this.nutrients,
    required this.pricePerQuintal,
    required this.origin,
    required this.duration,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) => CropModel(
        id: json['id'] as int,
        name: json['name'] as String,
        thumbnail: json['thumbnail'] as String,
        details: json['details'] as String? ?? '',
        season: json['season'] as String? ?? '',
        soilType: json['soilType'] as String? ?? '',
        waterRequirement: json['waterRequirement'] as String? ?? '',
        harvestTime: json['harvestTime'] as String? ?? '',
        nutrients: (json['nutrients'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        pricePerQuintal: json['pricePerQuintal'] as int? ?? 0,
        origin: json['origin'] as String? ?? '',
        duration: json['duration'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail': thumbnail,
        'details': details,
        'season': season,
        'soilType': soilType,
        'waterRequirement': waterRequirement,
        'harvestTime': harvestTime,
        'nutrients': nutrients,
        'pricePerQuintal': pricePerQuintal,
        'origin': origin,
        'duration': duration,
      };

  Crop toEntity() => Crop(
        id: id,
        name: name,
        thumbnail: thumbnail,
        details: details,
        season: season,
        soilType: soilType,
        waterRequirement: waterRequirement,
        harvestTime: harvestTime,
        nutrients: nutrients,
        pricePerQuintal: pricePerQuintal,
        origin: origin,
        duration: duration,
      );

  static List<Crop> listFromJson(Map<String, dynamic> json) {
    final list = (json['crops'] as List<dynamic>? ?? []);
    return list
        .map((e) => CropModel.fromJson(e as Map<String, dynamic>).toEntity())
        .toList();
  }
}
