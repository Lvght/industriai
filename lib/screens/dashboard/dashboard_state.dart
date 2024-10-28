part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required int currentIndex,
  }) = _DashboardState;

  factory DashboardState.initial() => const DashboardState(currentIndex: 0);
}
