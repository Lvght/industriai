import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:industriai/database/models/database_type_indexes.dart';
import 'package:industriai/database/models/order.dart';

part 'service_order.g.dart';

class _DbFieldIndexes {
  static const int id = 0;
  static const int transcription = 1;
  static const int procedures = 2;
}

@HiveType(typeId: DatabaseTypeIndexes.serviceOrder)
@JsonSerializable()
class ServiceOrder extends HiveObject {
  @HiveField(_DbFieldIndexes.id)
  final String id;

  @HiveField(_DbFieldIndexes.transcription)
  final String transcription;

  @HiveField(_DbFieldIndexes.procedures)
  @JsonKey(name: 'orders')
  final List<Order> procedures;

  factory ServiceOrder.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderToJson(this);

  ServiceOrder({
    required this.id,
    required this.transcription,
    required this.procedures,
  });
}
