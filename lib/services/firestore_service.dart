import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/expense.dart';
import '../models/savings_goal.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get the current user's UID
  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  // ──────────────────────
  // EXPENSES
  // ──────────────────────

  /// Reference to the user's expenses collection
  CollectionReference<Map<String, dynamic>> get _expensesRef =>
      _db.collection('users').doc(_uid).collection('expenses');

  /// Add a new expense
  Future<void> addExpense(Expense expense) async {
    await _expensesRef.doc(expense.id).set(expense.toMap());
  }

  /// Get all expenses as a stream (real-time)
  Stream<List<Expense>> getExpenses() {
    return _expensesRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Expense.fromMap(doc.id, doc.data()))
            .toList());
  }

  /// Get expenses for the current week
  Stream<List<Expense>> getWeeklyExpenses() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);

    return _expensesRef
        .where('createdAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Expense.fromMap(doc.id, doc.data()))
            .toList());
  }

  /// Delete an expense
  Future<void> deleteExpense(String id) async {
    await _expensesRef.doc(id).delete();
  }

  /// Update an expense
  Future<void> updateExpense(Expense expense) async {
    await _expensesRef.doc(expense.id).update(expense.toMap());
  }

  // ──────────────────────
  // SAVINGS GOALS
  // ──────────────────────

  /// Reference to the user's savings goals collection
  CollectionReference<Map<String, dynamic>> get _goalsRef =>
      _db.collection('users').doc(_uid).collection('goals');

  /// Add a savings goal
  Future<void> addGoal(SavingsGoal goal) async {
    await _goalsRef.doc(goal.id).set(goal.toMap());
  }

  /// Get all goals as a stream
  Stream<List<SavingsGoal>> getGoals() {
    return _goalsRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => SavingsGoal.fromMap(doc.id, doc.data()))
            .toList());
  }

  /// Update a goal (e.g., add funds)
  Future<void> updateGoal(SavingsGoal goal) async {
    await _goalsRef.doc(goal.id).update(goal.toMap());
  }

  /// Delete a goal
  Future<void> deleteGoal(String id) async {
    await _goalsRef.doc(id).delete();
  }
}
