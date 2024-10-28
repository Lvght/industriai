import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:industriai/global_cubits/service_order/service_order_cubit.dart';

class ServiceOrderListScreen extends StatefulWidget {
  const ServiceOrderListScreen({super.key});

  @override
  State<ServiceOrderListScreen> createState() => _ServiceOrderListScreenState();
}

class _ServiceOrderListScreenState extends State<ServiceOrderListScreen> {
  final _cubit = ServiceOrderCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceOrderCubit, ServiceOrderState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
          initial: _renderInitial,
          error: _renderError,
          loaded: _renderLoaded,
        );
      },
    );
  }

  Widget _renderInitial() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _renderError(
    List<ServiceOrder> alreadyLoadedOrders,
    String errorMessage,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ocorreu um erro ao carregar as Ordens de Serviço.',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(errorMessage),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _cubit.fetch();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderLoaded(List<ServiceOrder> serviceOrders) {
    return Scaffold(
      body: ListView.builder(
        itemCount: serviceOrders.length,
        itemBuilder: (context, index) {
          final order = serviceOrders[index];
          return ListTile(
            title: Text(order.transcription),
          );
        },
      ),
    );
  }
}
