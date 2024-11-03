import 'package:fit_wallet/obx.dart';
import 'package:fit_wallet/pages/start_page.dart';
import 'package:fit_wallet/providers/current_page_provider.dart';
import 'package:fit_wallet/utils/theme_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrentPageProvider())
        ],
        child: const StartPage(),
      ),
      themeMode: ThemeMode.light,
    );
  }
}
