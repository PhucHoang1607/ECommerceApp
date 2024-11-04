part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/splashedScreen',
      builder: (context, state) => SplashedScreen(),
    ),
    GoRoute(
      path: '/welcomeScreen',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/mainOnBoardingScreen',
      builder: (context, state) => MainBoarding(),
    ),
  ],
);
