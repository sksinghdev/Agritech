import 'package:equatable/equatable.dart';


class Crop extends Equatable {
final int id;
final String name;
final String thumbnail;
final String details;
const Crop({required this.id, required this.name, required this.thumbnail, required this.details});
@override
List<Object?> get props => [id, name, thumbnail, details];
}