import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
// Define tabs when you add a ShellRoute in AppRouter
      ],
      bottomNavigationBuilder: (_, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.spa), label: 'Crops'),
          NavigationDestination(icon: Icon(Icons.cloud), label: 'Weather'),
          NavigationDestination(
              icon: Icon(Icons.water_drop), label: 'Irrigation'),
          NavigationDestination(
              icon: Icon(Icons.attach_money), label: 'Market'),
        ],
      ),
    );
  }
}
