import 'package:abdelmoneam_create_an_animation_scroll/core/utiles/my_observer.dart';
import 'package:abdelmoneam_create_an_animation_scroll/local/shared_preferances.dart';
import 'package:abdelmoneam_create_an_animation_scroll/room_decore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const HomeDecorate());
}

Future<void> init() async {
  await CacheHelper.init();
   Bloc.observer = MyObserver();
}
