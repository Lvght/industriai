import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/components/order_card.dart';
import 'package:industriai/database/models/order.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:industriai/database/repositories/service_order_repository_interface.dart';
import 'package:industriai/screens/original_content_for_service_order.dart';

class ServiceOrderCard extends StatefulWidget {
  const ServiceOrderCard(this.serviceOrder, {super.key});

  final ServiceOrder serviceOrder;

  @override
  State<ServiceOrderCard> createState() => _ServiceOrderCardState();
}

class _ServiceOrderCardState extends State<ServiceOrderCard> {
  final _serviceOrderRepository = GetIt.I<ServiceOrderRepositoryInterface>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _serviceOrderRepository.watch(widget.serviceOrder.id),
      initialData: widget.serviceOrder,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final serviceOrder = snapshot.data!;

        return Container(
          margin: const EdgeInsets.all(12),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ordem de serviço #${serviceOrder.id.substring(0, 8)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Divider(),
                  const SizedBox(height: 8),
                  _renderOrders(serviceOrder.orders),
                  const SizedBox(height: 24),
                  ListTile(
                    onTap: () {
                      final route = MaterialPageRoute(
                        builder: (context) =>
                            OriginalContentForServiceOrder(serviceOrder),
                      );
                      Navigator.of(context).push(route);
                    },
                    leading: Icon(Icons.stream),
                    title: Text(
                      'Esta ordem de serviço foi enriquecida com IA',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    subtitle: Text('Clique para ver os arquivos originais.'),
                  ),
                  const Divider(),
                  Text(serviceOrder.id),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _renderOrders(List<Order> orders) {
    final content = orders.map((order) {
      return OrderCard(order);
    }).toList();

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: content,
    ));
  }
}
