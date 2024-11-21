import 'package:abdelmoneam_create_an_animation_scroll/core/routes/routes_keys.dart';
import 'package:abdelmoneam_create_an_animation_scroll/feature/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final goRouter = GoRouter(
    initialLocation: RoutesKeys.home,
    routes: [
      GoRoute(
        path: RoutesKeys.home,
        name: "home",
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
