import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/theme.dart';
import 'package:couldai_user_app/screens/main_container.dart';
import 'package:couldai_user_app/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const StudyHelperApp());
}

class StudyHelperApp extends StatelessWidget {
  const StudyHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Helper AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => const MainContainer(),
      },
    );
  }
}
