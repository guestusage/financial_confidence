import 'package:flutter/material.dart';
import '../models/savings_goal.dart';
import '../services/firestore_service.dart';

class SavingsProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  List<SavingsGoal> _goals = [];

  List<SavingsGoal> get goals => _goals;

  /// Total saved across all goals
  double get totalSaved => _goals.fold(0.0, (sum, g) => sum + g.currentAmount);

  /// Total target across all goals
  double get totalTarget => _goals.fold(0.0, (sum, g) => sum + g.targetAmount);

  /// Number of completed goals
  int get completedCount => _goals.where((g) => g.isCompleted).length;

  /// Listen to goals
  void listenToGoals() {
    _firestoreService.getGoals().listen((goals) {
      _goals = goals;
      notifyListeners();
    });
  }

  /// Add a new goal
  Future<void> addGoal(SavingsGoal goal) async {
    await _firestoreService.addGoal(goal);
  }

  /// Delete a goal
  Future<void> deleteGoal(String id) async {
    await _firestoreService.deleteGoal(id);
  }

  /// Add funds to a goal
  Future<void> addFunds(SavingsGoal goal, double amount) async {
    final updated = goal.copyWith(
      currentAmount: goal.currentAmount + amount,
    );
    await _firestoreService.updateGoal(updated);
  }
}
