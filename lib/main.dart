import 'package:fit_wallet/obx.dart';
import 'package:fit_wallet/pages/start_page.dart';
import 'package:fit_wallet/utils/theme_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_theme_mode_provider.dart';
import 'providers/current_page_provider.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(ChangeNotifierProvider(
      create: (context) => AppThemeModeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeModeProvider>(
      builder: (context, value, child) => MaterialApp(
        title: 'Fit Wallet',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CurrentPageProvider()),
          ],
          child: const StartPage(),
        ),
        themeMode:
            Provider.of<AppThemeModeProvider>(context, listen: true).mode,
      ),
    );
  }
}
