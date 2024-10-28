import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:industriai/api_clients/service_order_api_client.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/models/maintenance.dart';
import 'package:industriai/database/models/order.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:industriai/database/repositories/service_order_repository.dart';
import 'package:industriai/database/repositories/service_order_repository_interface.dart';

import 'package:industriai/helpers/configuration.dart';
import 'package:industriai/screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const InitialLoad(),
    );
  }
}

class InitialLoad extends StatefulWidget {
  const InitialLoad({super.key});

  @override
  State<InitialLoad> createState() => _InitialLoadState();
}

class _InitialLoadState extends State<InitialLoad> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _registerDatabaseAdapters();
      _registerServices();
      _sendToNextStep();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _registerServices() {
    GetIt.I.registerSingleton<ServiceOrderRepositoryInterface>(
        ServiceOrderRepository());
    GetIt.I.registerSingleton<Dio>(_getHttpClient());
    GetIt.I.registerSingleton<ServiceOrderApiClientInterface>(
      ServiceOrderApiClient(),
    );
  }

  void _sendToNextStep() {
    final navigator = Navigator.of(context);
    final route = MaterialPageRoute(
      builder: (context) => const DashboardScreen(),
    );
    navigator.pushReplacement(route);
  }

  Future<void> _registerDatabaseAdapters() async {
    await Hive.initFlutter('hive');

    Hive.registerAdapter(MaintenanceAdapter());
    Hive.registerAdapter(OrderAdapter());
    Hive.registerAdapter(ServiceOrderAdapter());

    await Hive.openBox<ServiceOrder>('service_order');
  }

  Dio _getHttpClient() {
    final options = BaseOptions(baseUrl: Configuration.baseUrl);
    return Dio(options);
  }
}
