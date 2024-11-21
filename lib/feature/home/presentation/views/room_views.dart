import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_state.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/widgets/room_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsViews extends StatelessWidget {
  const RoomsViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ValueListenableBuilder(
            valueListenable: controller.pageNotifier,
            builder: (context, value, child) {
              return PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: controller.images.length,
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.resetOpeningContainer(value);
                },
                itemBuilder: (context, index) => Transform(
                  transform: controller.getTransform(index),
                  child: RoomItem(
                    onSwipeUp: () {
                      controller.changeScaling(index);
                    },
                    onSwipeDown: () {
                      controller.changeScaling(index);
                    },
                    index: index,
                    showInformation: controller.showInformation,
                    selectedIndex: controller.selectedIndex,
                    persentage: value - index,
                    image: controller.images[index],
                    title: controller.titles[index],
                  ),
                ),
              );
            });
      },
    );
  }
}
