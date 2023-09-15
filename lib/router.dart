import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/features/common/main_navigation/main_navigation_screen.dart';
import 'package:twitter_challenge/features/users/screens/privacy_screen.dart';
import 'package:twitter_challenge/features/users/screens/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: MainNavigationScreen.routeUrl,
      builder: (context, state) => const MainNavigationScreen(
        tab: '',
      ),
    ),
    GoRoute(
      path: "/:tab(search|activity)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      path: UserProfileScreen.routeUrl,
      name: UserProfileScreen.routeName,
      builder: (context, state) =>
          const MainNavigationScreen(tab: UserProfileScreen.routeName),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeUrl,
          name: PrivacyScreen.routeName,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
