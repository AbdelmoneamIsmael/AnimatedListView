import 'package:abdelmoneam_create_an_animation_scroll/core/app_bloc/app_bloc.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/app_bloc/app_states.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/routes/routes_pass.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/theme/app_theme.dart';
import 'package:abdelmoneam_create_an_animation_scroll/local/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
class HomeDecorate extends StatelessWidget {
  const HomeDecorate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppStates>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: CacheHelper.getData(key: CacheKey.lightTheme)
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
            routerConfig: AppRouter.goRouter,
          );
        },
      ),
    );
  }
}
