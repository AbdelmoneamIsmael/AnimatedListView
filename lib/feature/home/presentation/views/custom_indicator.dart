import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Positioned(
          right: 0,
          left: 0,
          bottom: MediaQuery.sizeOf(context).height * .15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                activeIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                count: BlocProvider.of<HomeCubit>(context).titles.length,
                effect: WormEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "MADE BY",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Eng Abdelmoenam Ismael",
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        );
      },
    );
  }
}
