import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BunkMasterApp());
}

class BunkMasterApp extends StatelessWidget {
  const BunkMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunk Master',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getRoyalDarkTheme(),
      home: const HomeScreen(),
    );
  }
}