import 'package:cloud_firestore/cloud_firestore.dart';
import 'category.dart';

class Expense {
  final String id;
  final double amount;
  final ExpenseCategory category;
  final String? note;
  final DateTime createdAt;

  Expense({
    required this.id,
    required this.amount,
    required this.category,
    this.note,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Convert to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category.name,
      'note': note,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// Create from Firestore document
  factory Expense.fromMap(String id, Map<String, dynamic> map) {
    return Expense(
      id: id,
      amount: (map['amount'] as num).toDouble(),
      category: ExpenseCategory.values.firstWhere(
        (c) => c.name == map['category'],
        orElse: () => ExpenseCategory.other,
      ),
      note: map['note'] as String?,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
