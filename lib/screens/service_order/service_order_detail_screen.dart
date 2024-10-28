import 'package:flutter/material.dart';

class ServiceOrderDetailScreen extends StatefulWidget {
  const ServiceOrderDetailScreen({
    required this.serviceOrderId,
    super.key,
  });

  final int serviceOrderId;

  @override
  State<ServiceOrderDetailScreen> createState() =>
      _ServiceOrderDetailScreenState();
}

class _ServiceOrderDetailScreenState extends State<ServiceOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
