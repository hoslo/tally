import 'package:hooks_riverpod/hooks_riverpod.dart';

final statisticTypeProvider = StateProvider<String>((ref) => "月统计");

final timeProvider = StateProvider<DateTime>((ref) => DateTime.now());