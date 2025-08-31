import '../../domain/entities/irrigation.dart';

class FieldScheduleModel {
  final int id;
  final String name;
  final String schedule;
  FieldScheduleModel(
      {required this.id, required this.name, required this.schedule});
  factory FieldScheduleModel.fromJson(Map<String, dynamic> j) =>
      FieldScheduleModel(id: j['id'], name: j['name'], schedule: j['schedule']);
  FieldSchedule toEntity() =>
      FieldSchedule(id: id, name: name, schedule: schedule);
  static List<FieldSchedule> listFromJson(Map<String, dynamic> json) =>
      (json['fields'] as List)
          .map((e) => FieldScheduleModel.fromJson(e).toEntity())
          .toList();
}
