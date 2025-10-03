import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.routeName,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.routeName,
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.routeName,
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbar',
      name: SnackbarScreen.routeName,
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.routeName,
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui_controls',
      name: UIControlsScreen.routeName,
      builder: (context, state) => UIControlsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.routeName,
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(
      path: '/infinite_scroll',
      name: InfiniteScrollScreen.routeName,
      builder: (context, state) => InfiniteScrollScreen(),
    ),
  ],
);
