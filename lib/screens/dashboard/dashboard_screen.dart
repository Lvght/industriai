import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:industriai/screens/dashboard/dashboard_cubit.dart';
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
              Scaffold(
                body: Center(
                  child: FilledButton(
                      onPressed: () async {
                        final record = AudioRecorder();
                        if (await record.hasPermission()) {
                          final documentsDirectory =
                              await getApplicationDocumentsDirectory();
                          final filePath =
                              '${documentsDirectory.path}/testaudio.m4a';
                          await record.start(const RecordConfig(),
                              path: filePath);
                        }

                        await Future.delayed(Duration(seconds: 3));
                        final path = await record.stop();
                        record.dispose();

                        print('New file path is $path');
                      },
                      child: Text('Gravar')),
                ),
              ),
              Container(color: Colors.blue),
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
