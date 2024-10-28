import 'package:flutter/material.dart';
import 'package:industriai/components/maintenance_card.dart';
import 'package:industriai/database/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(this.order, {super.key});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final maintenanceCards = order.maintenance.map((maintenance) {
      return MaintenanceCard(maintenance);
    }).toList();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            order.machine,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ...maintenanceCards,
        ],
      ),
    );
  }
}
