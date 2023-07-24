import 'package:flutter/material.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (context) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (context) => TabsScreen(),
        );
      default:
        return null;
    }
  }
}
