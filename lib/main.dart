import 'package:fit_wallet/obx.dart';
import 'package:fit_wallet/screens/home_screen.dart';
import 'package:fit_wallet/utils/theme_scheme.dart';
import 'package:flutter/material.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
      themeMode: ThemeMode.light,
    );
  }
}
