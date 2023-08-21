import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/themes/dart.dart';
import 'package:tally/themes/light.dart';
import 'package:themed/themed.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  
  Map<ThemeRef, Object>? get anotherTheme => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Switch(
        value: Themed.ifCurrentThemeIs(darkTheme),
        onChanged: (value) {
          if (Themed.ifCurrentThemeIs(darkTheme)) {
            Themed.clearCurrentTheme();
          } else {
            print('set dark theme: $darkTheme');
            Themed.currentTheme = darkTheme;
          }
        },
      )
    );
  }
}