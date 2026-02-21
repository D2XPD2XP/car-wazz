import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_wazz/models/transaction.dart';

class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _transactionCollection(
      String userId) {
    return _firestore
        .collection('user')
        .doc(userId)
        .collection('transactions');
  }

  Stream<List<TransactionModel>> getAllTransactions(String userId) {
    return _transactionCollection(userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                TransactionModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  Stream<List<TransactionModel>> getTransactionsByEmployee(
      String userId, String employeeId) {
    return _transactionCollection(userId)
        .where('employee_id', isEqualTo: employeeId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                TransactionModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  Stream<List<TransactionModel>> getTodayTransactions(String userId) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    return _transactionCollection(userId)
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThan: end)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                TransactionModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  Stream<List<TransactionModel>> getTodayTransactionsByEmployee(
      String userId, String employeeId) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    return _transactionCollection(userId)
        .where('employee_id', isEqualTo: employeeId)
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThan: end)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                TransactionModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  Future<void> addTransaction(
      String userId, TransactionModel transaction) async {
    await _transactionCollection(userId)
        .doc(transaction.transactionId)
        .set(transaction.toFirestore());
  }

  Future<void> updateTransaction(
      String userId, TransactionModel transaction) async {
    await _transactionCollection(userId)
        .doc(transaction.transactionId)
        .update(transaction.toFirestore());
  }

  Future<void> deleteTransaction(String userId, String id) async {
    await _transactionCollection(userId).doc(id).delete();
  }
}