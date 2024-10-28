import 'package:hive/hive.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:industriai/database/repositories/service_order_repository_interface.dart';

class ServiceOrderRepository implements ServiceOrderRepositoryInterface {
  final _dao = Hive.box<ServiceOrder>('service_order');

  @override
  ServiceOrder? read(String id) {
    return _dao.get(id);
  }

  @override
  Stream<ServiceOrder> watch(String id) {
    return _dao.watch(key: id).map((e) => e.value);
  }

  @override
  Stream<List<ServiceOrder>> watchAll() {
    return _dao.watch().map((e) => e.value.toList());
  }

  @override
  Future<void> write(ServiceOrder order) async {
    await _dao.put(order.id, order);
  }
}
