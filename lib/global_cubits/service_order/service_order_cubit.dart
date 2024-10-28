import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/models/service_order.dart';

part 'service_order_cubit.freezed.dart';
part 'service_order_state.dart';

class ServiceOrderCubit extends Cubit<ServiceOrderState> {
  final _serviceOrderApiClient =
      GetIt.instance<ServiceOrderApiClientInterface>();

  ServiceOrderCubit() : super(const ServiceOrderState.initial()) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      final orders = await _serviceOrderApiClient.fetchServiceOrders();
      final newState = ServiceOrderState.loaded(serviceOrders: orders);
      emit(newState);
    } on FetchServiceOrderException catch (e) {
      final currentOrders = state.maybeMap(
        loaded: (loaded) => loaded.serviceOrders,
        orElse: () => <ServiceOrder>[],
      );

      final newState = ServiceOrderState.error(
          alreadyLoadedOrders: currentOrders, errorMessage: e.message);
      emit(newState);
    }
  }

  Future<void> createServiceOrderFromAudio({
    required String audioPath,
  }) async {
    final currentOrders = state.maybeMap(
      loaded: (loaded) => loaded.serviceOrders,
      error: (error) => error.alreadyLoadedOrders,
      orElse: () => <ServiceOrder>[],
    );

    try {
      final result = await _serviceOrderApiClient.createServiceOrderFromAudio(
          audioPath: audioPath);
      final newOrders = [result, ...currentOrders];
      final newState = ServiceOrderState.loaded(serviceOrders: newOrders);
      emit(newState);
    } on Exception catch (e) {
      emit(ServiceOrderState.error(
          alreadyLoadedOrders: currentOrders, errorMessage: e.toString()));
    }
  }
}
