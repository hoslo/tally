DateTime getWeekStart(DateTime now) {
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  startOfWeek = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
  return startOfWeek;
}

DateTime getMonthStart(DateTime now) {
  DateTime startOfMonth = DateTime(now.year, now.month, 1);
  return startOfMonth;
}

DateTime getWeekEnd(DateTime now) {
  DateTime endOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
  endOfWeek = DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day);
  return endOfWeek;
}

DateTime getMonthEnd(DateTime now) {
  DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
  return endOfMonth;
}