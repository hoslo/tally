import 'package:const_date_time/const_date_time.dart';

class Bill {
  String note;
  double amount;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  Bill({
    this.icon = "",
    this.note = "",
    this.amount = 0,
    this.createdAt = const ConstDateTime(0),
    this.updatedAt = const ConstDateTime(0),
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'amount': amount,
      'icon': icon,
    };
  }

  // convert a Map object into a Dog object.
  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      icon: map['icon'],
      note: map['note'],
      amount: map['amount'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  // copyWith method
  Bill copyWith({
    String? note,
    double? amount,
    String? icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Bill(
      note: note ?? this.note,
      amount: amount ?? this.amount,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
