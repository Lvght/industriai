import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/app_database.dart';

class ServiceOrderApiClient implements ServiceOrderApiClientInterface {
  @override
  Future<List<ServiceOrder>> fetchServiceOrders() async {
    throw FetchServiceOrderException('Isto é um teste');
  }
}
