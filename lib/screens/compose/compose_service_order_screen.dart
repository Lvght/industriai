import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:industriai/screens/compose/cubit/compose_cubit.dart';

class ComposeServiceOrderScreen extends StatefulWidget {
  const ComposeServiceOrderScreen({super.key});

  @override
  State<ComposeServiceOrderScreen> createState() =>
      _ComposeServiceOrderScreenState();
}

class _ComposeServiceOrderScreenState extends State<ComposeServiceOrderScreen> {
  final _cubit = ComposeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeCubit, ComposeState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Text('Crie uma ordem de serviço usando sua voz'),
              _renderRecordButton(state)
            ],
          ),
        );
      },
    );
  }

  Widget _renderRecordButton(ComposeState state) {
    if (!state.isRecording) {
      return FilledButton.icon(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.error),
          foregroundColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.onError),
        ),
        onPressed: () {
          _cubit.record();
        },
        icon: Icon(Icons.fiber_manual_record_rounded),
        label: Text('Gravar'),
      );
    }

    return FilledButton.icon(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.error),
        foregroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.onError),
      ),
      onPressed: () async {
        await _cubit.stopRecording();
        await _cubit.send();
      },
      icon: Icon(Icons.stop_rounded),
      label: Text('Parar'),
    );
  }
}
