import 'package:abdelmoneam_create_an_animation_scroll/core/app_bloc/app_states.dart';
import 'package:abdelmoneam_create_an_animation_scroll/local/shared_preferances.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(InitState());

  void add(AppStates state) {
    switch (state) {
      case InitState():
        emit(InitState());
        break;
      case AppChangeThemeEvent():
        CacheHelper.saveData(
            key: CacheKey.lightTheme,
            value: !CacheHelper.getData(key: CacheKey.lightTheme));
        emit(AppChangeThemeEvent());
        break;
    }
  }
}
