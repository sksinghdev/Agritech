import 'package:equatable/equatable.dart';

class FieldSchedule extends Equatable {
  final int id;
  final String name;
  final String schedule;
  const FieldSchedule(
      {required this.id, required this.name, required this.schedule});
  @override
  List<Object?> get props => [id, name, schedule];
}
