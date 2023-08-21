class Bill {
  String note;
  double amount;
  String icon;
  int createdAt;
  int updatedAt;

  Bill({
    this.icon = "",
    this.note = "",
    this.amount = 0,
    this.createdAt = 0,
    this.updatedAt = 0,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'amount': amount,
      'icon': icon,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  // convert a Map object into a Dog object.
  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      icon: map['icon'],
      note: map['note'],
      amount: map['amount'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  // copyWith method
  Bill copyWith({
    String? note,
    double? amount,
    String? icon,
    int? createdAt,
    int? updatedAt,
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
