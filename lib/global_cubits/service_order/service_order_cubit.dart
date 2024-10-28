import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/app_database.dart';

part 'service_order_state.dart';
part 'service_order_cubit.freezed.dart';

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
}
