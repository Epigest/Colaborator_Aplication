import 'package:epigest_client/core/theme/viewmodels/theme_viewmodel.dart';
import 'package:epigest_client/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';

class AppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final bool backButton;

  const AppBarWidget({super.key, required this.backButton});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeViewModelProvider) == ThemeMode.dark;
    final themeViewModel = ref.read(themeViewModelProvider.notifier);

    return AppBar(
      automaticallyImplyLeading: widget.backButton,
      title: Text("EPIGest"),
      centerTitle: false,
      actions: [
        if (Routefly.currentOriginalPath != routePaths.notification)
          Badge(
            label: Text('3'),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Routefly.push(routePaths.notification);
              },
            ),
          ),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            themeViewModel.toggleTheme();
          },
        ),
      ],
    );
  }
}
