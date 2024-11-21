import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<String> images = [
    "assets/images/bedroom.png",
    "assets/images/ketchin.png",
    "assets/images/office.png",
    "assets/images/pathroom.png",
    "assets/images/reception.png",
  ];

  List<String> titles = [
    "Bedroom",
    "Kitchen",
    "Office",
    "Pathroom",
    "Reception",
  ];
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  ValueNotifier<double> pageNotifier = ValueNotifier(0.0);
  int selectedIndex = -1;
  bool showInformation = false;
  int currentIndex = 0;
  void onInit() {
    pageController.addListener(pageListener);
  }

  @override
  Future<void> close() {
    pageController.removeListener(pageListener);
    pageController.dispose();

    pageNotifier.dispose();
    return super.close();
  }

  void pageListener() => pageNotifier.value = pageController.page ?? 0;

  void changeScaling(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      showInformation = true;
    } else {
      showInformation = !showInformation;
      selectedIndex = -1;
    }

    emit(ChangeScalingState());
  }

  resetOpeningContainer(index) {
    currentIndex = index;
    selectedIndex = -1;
    showInformation = false;
    emit(ChangeScalingState());
  }

  Matrix4 getTransform(int index) {
    if (selectedIndex == index || !showInformation) {
      return Matrix4.translationValues(0, 0, 0);
    } else if (index > selectedIndex) {
      return Matrix4.translationValues(30, 0, 0);
    } else {
      return Matrix4.translationValues(-30, 0, 0);
    }
  }
}
