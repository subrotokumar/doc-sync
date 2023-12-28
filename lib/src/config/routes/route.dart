import 'package:docsync/src/features/auth/presentation/screens/login_screen.dart';
import 'package:docsync/src/features/common/presentation/screens/splash_screen.dart';
import 'package:docsync/src/features/editor/presentations/screens/editor_screen.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/login',
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
      path: '/editor',
      builder: (context, state) => const EditorScreen(),
    ),
  ],
);
