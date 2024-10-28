import 'package:flutter/material.dart';
import 'package:industriai/database/models/service_order.dart';

class OriginalContentForServiceOrder extends StatelessWidget {
  const OriginalContentForServiceOrder(this.serviceOrder, {super.key});

  final ServiceOrder serviceOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transcrição',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(serviceOrder.transcription)
            ],
          ),
        ),
      ),
    );
  }
}
