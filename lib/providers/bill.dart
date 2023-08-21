import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/models/bill.dart';

final billProvider = StateNotifierProvider<BillNotifier, Bill>((ref) {
  return BillNotifier();
});

class BillNotifier extends StateNotifier<Bill> {
  BillNotifier() : super(Bill ());

  get amount => state.amount;
  get icon => state.icon;
  get note => state.note;

  void setIcon(String icon) {
    final newState = state.copyWith(icon: icon);
    state = newState;
  }

  void setAmount(double amount) {
    final newState = state.copyWith(amount: amount);
    state = newState;
  }

  void setNote (String note) {
    final newState = state.copyWith(note: note);
    state = newState;
  }
}

final submitProvider = StateProvider<bool>((ref) => false);
