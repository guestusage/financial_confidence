import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../models/category.dart';
import '../services/firestore_service.dart';

class ExpenseProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  List<Expense> _expenses = [];
  List<Expense> _weeklyExpenses = [];
  double _weeklyBudget = 500.0;

  List<Expense> get expenses => _expenses;
  List<Expense> get weeklyExpenses => _weeklyExpenses;
  double get weeklyBudget => _weeklyBudget;

  /// Total spent this week
  double get weeklyTotal =>
      _weeklyExpenses.fold(0.0, (sum, e) => sum + e.amount);

  /// Weekly budget usage (0.0 - 1.0)
  double get weeklyProgress =>
      _weeklyBudget > 0 ? (weeklyTotal / _weeklyBudget).clamp(0.0, 1.0) : 0.0;

  /// Spending by category this week
  Map<ExpenseCategory, double> get categoryTotals {
    final map = <ExpenseCategory, double>{};
    for (var expense in _weeklyExpenses) {
      map[expense.category] = (map[expense.category] ?? 0) + expense.amount;
    }
    return map;
  }

  /// Top 3 spending categories this week
  List<MapEntry<ExpenseCategory, double>> get topCategories {
    final sorted = categoryTotals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(3).toList();
  }

  /// Confidence Score (0 - 100)
  int get confidenceScore {
    if (_weeklyExpenses.isEmpty) return 100;
    final usage = weeklyProgress;
    if (usage <= 0.5) return 100;
    if (usage <= 0.7) return 85;
    if (usage <= 0.85) return 70;
    if (usage <= 1.0) return 50;
    return 30; // Over budget
  }

  /// Listen to all expenses
  void listenToExpenses() {
    _firestoreService.getExpenses().listen((expenses) {
      _expenses = expenses;
      notifyListeners();
    });
  }

  /// Listen to weekly expenses
  void listenToWeeklyExpenses() {
    _firestoreService.getWeeklyExpenses().listen((expenses) {
      _weeklyExpenses = expenses;
      notifyListeners();
    });
  }

  /// Add expense
  Future<void> addExpense(Expense expense) async {
    await _firestoreService.addExpense(expense);
  }

  /// Delete expense
  Future<void> deleteExpense(String id) async {
    await _firestoreService.deleteExpense(id);
  }

  /// Update weekly budget
  void setWeeklyBudget(double amount) {
    _weeklyBudget = amount;
    notifyListeners();
  }
}
