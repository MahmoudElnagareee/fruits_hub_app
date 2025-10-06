import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:fruits_hub_app/core/helper_function/on_generate_routes.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => FruitHub()),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
