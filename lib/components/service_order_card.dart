import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/database/models/order.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:industriai/database/repositories/service_order_repository_interface.dart';

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

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(serviceOrder.transcription),
                _renderProcedures(serviceOrder.orders),
                const Divider(),
                Text(serviceOrder.id),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _renderProcedures(List<Order> orders) {
    return Container(
      child: Text('oi'),
    );
  }
}
