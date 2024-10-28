import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

part 'compose_state.dart';
part 'compose_cubit.freezed.dart';

class ComposeCubit extends Cubit<ComposeState> {
  final _apiClient = GetIt.instance<ServiceOrderApiClientInterface>();

  ComposeCubit() : super(ComposeState.initial()) {
    initialize();
  }

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    audioPath = '${dir.path}/audio.wav';
  }

  final _recorder = AudioRecorder();
  String audioPath = '';

  Future<void> record() async {
    final newState = state.copyWith(isRecording: true);
    emit(newState);

    final recordConfig = RecordConfig();
    await _recorder.start(recordConfig, path: audioPath);
    print('Coemçou a gravar');
  }

  Future<void> stopRecording() async {
    emit(state.copyWith(isRecording: false));
    final result = await _recorder.stop();

    if (result != null) {
      audioPath = result;
    }
  }

  Future<void> send() async {
    emit(state.copyWith(isSending: true));
    await _apiClient.createServiceOrderFromAudio(audioPath: audioPath);
  }
}
