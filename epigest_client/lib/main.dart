import 'package:epigest_client/core/theme/theme.dart';
import 'package:epigest_client/core/theme/viewmodels/theme_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'main.route.dart';
part 'main.g.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

@Main('lib/ui/')
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeViewModelProvider);

    return MaterialApp.router(
      themeMode: themeMode,
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.login
      ),
    );
  }
}
