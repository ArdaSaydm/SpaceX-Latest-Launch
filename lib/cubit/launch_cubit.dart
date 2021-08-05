import 'package:bloc/bloc.dart';
import 'package:spacex/models/latest_launch_model.dart';
import 'package:spacex/repository/launch_repository.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit(this._repository) : super(InitialState()) {
    getLatestLaunch();
  }

  final LaunchRepository _repository;

  void getLatestLaunch() async {
    try {
      emit(LoadingState());
      final latestLaunch = await _repository.getLaunchWithParameter('/latest');
      if (latestLaunch == null) {
        emit(ErrorState("There are some issues."));
      } else {
        emit(LoadedState(latestLaunch));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
