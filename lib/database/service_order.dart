import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:industriai/database/database_type_indexes.dart';

part 'service_order.g.dart';

@HiveType(typeId: DatabaseTypeIndexes.serviceOrder)
@JsonSerializable()
class ServiceOrder extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  @JsonKey(name: 'transcription')
  final String transcription;

  factory ServiceOrder.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderToJson(this);

  ServiceOrder({
    required this.id,
    required this.transcription,
  });
}
