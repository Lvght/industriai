import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:industriai/screens/compose/compose_service_order_screen.dart';
import 'package:industriai/screens/dashboard/dashboard_cubit.dart';
import 'package:industriai/screens/service_order/service_order_list_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _cubit = DashboardCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              ComposeServiceOrderScreen(),
              ServiceOrderListScreen(),
              Container(color: Colors.amber),
              Container(color: Colors.green),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) {
              _cubit.changeIndex(index);
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_rounded), label: 'Início'),
              NavigationDestination(
                  icon: Icon(Icons.mic_rounded), label: 'Criar'),
              NavigationDestination(
                  icon: Icon(Icons.menu_rounded), label: 'Mais opções'),
            ],
          ),
        );
      },
    );
  }
}
