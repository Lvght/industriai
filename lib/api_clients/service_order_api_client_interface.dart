import 'package:industriai/database/service_order.dart';

class FetchServiceOrderException implements Exception {
  final String message;

  FetchServiceOrderException(this.message);
}

abstract interface class ServiceOrderApiClientInterface {
  Future<List<ServiceOrder>> fetchServiceOrders();

  Future<ServiceOrder> createServiceOrderFromAudio({
    required String audioPath,
  });
}
