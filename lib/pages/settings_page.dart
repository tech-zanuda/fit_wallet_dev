import 'package:fit_wallet/providers/app_theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Column(
        children: [
          ListTile(
            title: AutoSizeText(
              'Тема приложения',
              maxLines: 1,
            ),
            subtitle: switch (
                context.read<AppThemeModeProvider>().appThemeMode) {
              AppThemeMode.light => Text('Светлая тема'),
              AppThemeMode.dark => Text('Темная тема'),
              AppThemeMode.system => Text('Системная тема'),
              _ => SizedBox()
            },
            trailing: SegmentedButton<AppThemeMode>(
              style: SegmentedButton.styleFrom(
                  visualDensity: VisualDensity(horizontal: -4, vertical: 0)),
              showSelectedIcon: false,
              segments: const <ButtonSegment<AppThemeMode>>[
                ButtonSegment<AppThemeMode>(
                    value: AppThemeMode.light, icon: Icon(Icons.light_mode)),
                ButtonSegment<AppThemeMode>(
                    value: AppThemeMode.system,
                    icon: Icon(Icons.phone_android)),
                ButtonSegment<AppThemeMode>(
                    value: AppThemeMode.dark, icon: Icon(Icons.dark_mode)),
              ],
              selected: <AppThemeMode>{
                context.read<AppThemeModeProvider>().appThemeMode
              },
              onSelectionChanged: (Set<AppThemeMode> newSelection) {
                context
                    .read<AppThemeModeProvider>()
                    .setAppThemeMode(newSelection.first);
              },
            ),
          )
        ],
      ),
    ));
  }
}
