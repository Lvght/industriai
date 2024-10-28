import 'package:industriai/database/app_database.dart';

class FetchServiceOrderException implements Exception {
  final String message;

  FetchServiceOrderException(this.message);
}

abstract interface class ServiceOrderApiClientInterface {
  Future<List<ServiceOrder>> fetchServiceOrders();
}
