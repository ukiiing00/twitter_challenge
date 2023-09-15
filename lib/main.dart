import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_challenge/features/users/repos/darkmode_config_repo.dart';
import 'package:twitter_challenge/features/users/view_models/darkmode_config_vm.dart';
import 'package:twitter_challenge/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkmodeConfigProvider.overrideWith(
          () => DarkModeConfigViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkmode = ref.watch(darkmodeConfigProvider).darkmode;
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      themeMode: darkmode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        textTheme: const TextTheme(),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
        bottomAppBarTheme:
            const BottomAppBarTheme(elevation: 0, color: Colors.black),
      ),
    );
  }
}
