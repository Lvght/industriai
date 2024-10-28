part of 'service_order_cubit.dart';

@freezed
class ServiceOrderState with _$ServiceOrderState {
  const factory ServiceOrderState.initial() = _Initial;

  const factory ServiceOrderState.error({
    required List<ServiceOrder> alreadyLoadedOrders,
    required String errorMessage,
  }) = _Error;

  const factory ServiceOrderState.loaded({
    required List<ServiceOrder> serviceOrders,
  }) = _Loaded;
}
