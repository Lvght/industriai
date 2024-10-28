part of 'compose_cubit.dart';

@freezed
class ComposeState with _$ComposeState {
  const factory ComposeState({
    required bool isRecording,
    required bool isSending,
  }) = _ComposeState;

  factory ComposeState.initial() => const ComposeState(
        isRecording: false,
        isSending: false,
      );
}
