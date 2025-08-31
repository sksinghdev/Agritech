import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final String crop;
  final String price;
  const Price({required this.crop, required this.price});
  @override
  List<Object?> get props => [crop, price];
}
