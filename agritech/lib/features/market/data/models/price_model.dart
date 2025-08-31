import '../../domain/entities/price.dart';

class PriceModel {
  final String crop;
  final String price;
  PriceModel({required this.crop, required this.price});
  factory PriceModel.fromJson(Map<String, dynamic> j) =>
      PriceModel(crop: j['crop'], price: j['price']);
  Price toEntity() => Price(crop: crop, price: price);
  static List<Price> listFromJson(Map<String, dynamic> json) =>
      (json['prices'] as List)
          .map((e) => PriceModel.fromJson(e).toEntity())
          .toList();
}
