import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/api_clients/service_order_api_client.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/app_database.dart';
import 'package:industriai/screens/service_order/service_order_list_screen.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    GetIt.I.registerSingleton(AppDatabase());
    GetIt.I.registerSingleton<ServiceOrderApiClientInterface>(
      ServiceOrderApiClient(),
    );
  }

  void _sendToNextStep() {
    final navigator = Navigator.of(context);
    final route = MaterialPageRoute(
      builder: (context) => const ServiceOrderListScreen(),
    );
    navigator.pushReplacement(route);
  }
}
