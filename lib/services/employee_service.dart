import 'package:car_wazz/models/employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _employeeCollection(String userId) {
    return _firestore.collection('user').doc(userId).collection('employees');
  }

  Future<void> createEmployee(String userId, Employee employee) async {
    await _employeeCollection(
      userId,
    ).doc(employee.employeeId).set(employee.toFirestore());
  }

  Stream<List<Employee>> getEmployees(String userId) {
    return _employeeCollection(userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Employee.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<Employee?> getEmployeeByDocId(
    String userId,
    String employeeDocId,
  ) async {
    final doc = await _employeeCollection(userId).doc(employeeDocId).get();

    if (doc.exists && doc.data() != null) {
      return Employee.fromFirestore(doc.data()!, doc.id);
    }
    return null;
  }

  Future<void> updateEmployee(
    String userId,
    String employeeDocId,
    Employee employee,
  ) async {
    await _employeeCollection(userId).doc(employeeDocId).update({
      'name': employee.name,
      'phone_number': employee.phoneNumber,
    });
  }

  Future<void> deleteEmployee(String userId, String employeeDocId) async {
    await _employeeCollection(userId).doc(employeeDocId).delete();
  }
}
