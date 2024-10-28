import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              Scaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final recorder = AudioRecorder();
                          final appDocumentsDirectory = await getApplicationDocumentsDirectory();
                          final recordedAudioPath = appDocumentsDirectory.path + '/recorder.wav';
                          final recordConfig = RecordConfig();

                          await recorder.start(recordConfig, path: recordedAudioPath);
                          await Future.delayed(Duration(seconds: 5));
                          await recorder.stop();


                          // Playing
                          final player = AudioPlayer();
                          final audioCache = DeviceFileSource(recordedAudioPath);

                          await audioCache.setOnPlayer(player);
                          await player.setVolume(1);
                          await player.play(audioCache);

                          await Future.delayed(Duration(seconds: 5));

                        },
                        child: Text('Ouvir'),
                      ),
                    ],
                  ),
                ),
              ),
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
