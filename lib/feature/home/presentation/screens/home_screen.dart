import 'package:abdelmoneam_create_an_animation_scroll/core/app_bloc/app_bloc.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/app_bloc/app_states.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/views/custom_indicator.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/views/room_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..onInit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
          ),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(AppChangeThemeEvent());
              },
              icon: const Icon(Icons.light_mode_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .031,
            ),
            Text(
              "SELECT A ROOM",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .041,
            ),
            const Expanded(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CustomIndecator(),
                  RoomsViews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

