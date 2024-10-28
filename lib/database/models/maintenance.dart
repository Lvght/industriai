import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:industriai/database/models/database_type_indexes.dart';

part 'maintenance.g.dart';

@JsonSerializable()
@HiveType(typeId: DatabaseTypeIndexes.maintenance)
class Maintenance extends HiveObject {
  @HiveField(0)
  final String procedure;

  Maintenance({
    required this.procedure,
  });

  factory Maintenance.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceToJson(this);
}
