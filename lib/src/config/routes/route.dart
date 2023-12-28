import 'package:docsync/src/features/auth/presentation/screens/login_screen.dart';
import 'package:docsync/src/features/auth/presentation/screens/splash_screen.dart';
import 'package:docsync/src/features/editor/presentations/screens/editor_screen.dart';
import 'package:docsync/src/features/home/presentation/screens/home.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/editor/:id',
      builder: (context, state) => EditorScreen(
        id: state.pathParameters['id'] as String,
      ),
    ),
  ],
);
