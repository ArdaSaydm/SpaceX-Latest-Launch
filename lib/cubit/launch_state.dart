part of 'launch_cubit.dart';

abstract class LaunchState {}

class InitialState extends LaunchState {}

class LoadingState extends LaunchState {}

class LoadedState extends LaunchState {
  final LatestLaunchModel latestLaunch;

  LoadedState(this.latestLaunch);
}

class ErrorState extends LaunchState {
  final message;

  ErrorState(this.message);
}
