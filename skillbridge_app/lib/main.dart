import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/student_dashboard.dart';

void main() {
  runApp(const SkillBridgeApp());
}

class SkillBridgeApp extends StatelessWidget {
  const SkillBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillBridge-AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const StudentDashboardScreen(),
    );
  }
}
