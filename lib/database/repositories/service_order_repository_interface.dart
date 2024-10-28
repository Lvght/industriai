import 'package:industriai/database/models/service_order.dart';

abstract interface class ServiceOrderRepositoryInterface {
  Future<void> write(ServiceOrder order);
  ServiceOrder? read(String id);
  Stream<ServiceOrder> watch(String id);
  Stream<List<ServiceOrder>> watchAll();
}
