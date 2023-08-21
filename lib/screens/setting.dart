import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: SizedBox(
      height: 89.h,
      child: Column(
        children: [
          Text(
            '切换主题',
            style: TextStyle(
              color: LightTheme.darkBlack,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Switch(
            value: Themed.ifCurrentThemeIs(darkTheme),
            onChanged: (value) {
              if (Themed.ifCurrentThemeIs(darkTheme)) {
                Themed.clearCurrentTheme();
              } else {
                Themed.currentTheme = darkTheme;
              }
            },
          ),
        ],
      ),
    ));
  }
}
