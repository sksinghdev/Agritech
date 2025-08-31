class Crop {
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

  const Crop({
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

}
