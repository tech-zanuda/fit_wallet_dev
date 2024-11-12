import 'package:fit_wallet/obx.dart';
import 'package:fit_wallet/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
      builder: (context, theme, child) => MaterialApp(
          title: 'Fit Wallet',
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(
              scheme: FlexScheme.blueWhale,
              subThemesData: const FlexSubThemesData(
                inputDecoratorIsFilled: true,
                inputDecoratorBorderType: FlexInputBorderType.outline,
              )),
          darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.blueWhale,
              subThemesData: const FlexSubThemesData(
                inputDecoratorIsFilled: true,
                inputDecoratorBorderType: FlexInputBorderType.outline,
              )),
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => CurrentPageProvider()),
            ],
            child: const StartPage(),
          ),
          themeMode: theme.mode),
    );
  }
}
