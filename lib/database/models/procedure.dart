import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:industriai/database/models/database_type_indexes.dart';
import 'package:industriai/database/models/maintenance.dart';

part 'procedure.g.dart';

@JsonSerializable()
@HiveType(typeId: DatabaseTypeIndexes.order)
class Order extends HiveObject {
  @HiveField(0)
  final String machine;

  @HiveField(1)
  final List<Maintenance> maintenances;

  Order({
    required this.machine,
    required this.maintenances,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
