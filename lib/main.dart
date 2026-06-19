import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_config.dart';
import 'screens/onboarding/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const ServeDesk());
}

class ServeDesk extends StatelessWidget {
  const ServeDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServeDesk',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme, // ← all tokens come from lib/core/app_config.dart
      home: const OnboardingScreen(),
    );
  }
}
