import 'package:flutter/material.dart';
import 'package:industriai/database/models/maintenance.dart';

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard(this.maintenance, {super.key});

  final Maintenance maintenance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.chevron_right),
        title: Text(
          maintenance.procedure,
          style: Theme.of(context).textTheme.labelLarge,
        ));
  }
}
