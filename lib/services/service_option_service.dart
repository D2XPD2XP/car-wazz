import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_wazz/models/service_option.dart';

class ServiceOptionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _getServiceCollection(String userId) {
    return _firestore
        .collection('user')
        .doc(userId)
        .collection('service_options');
  }

  Stream<List<ServiceOption>> getServiceOptions(String userId) {
    return _getServiceCollection(userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ServiceOption.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> createServiceOption(String userId, ServiceOption service) async {
    await _getServiceCollection(userId)
        .doc(service.serviceId)
        .set(service.toFirestore());
  }

  Future<void> updateServiceOption(
    String userId,
    String serviceId,
    Map<String, dynamic> update,
  ) async {
    await _getServiceCollection(userId).doc(serviceId).update(update);
  }

  Future<void> deleteServiceOption(String userId, String serviceId) async {
    await _getServiceCollection(userId).doc(serviceId).delete();
  }

  Future<ServiceOption?> getServiceOptionById(String userId, String serviceId) async {
    final doc = await _getServiceCollection(userId).doc(serviceId).get();
    if (!doc.exists) return null;
    return ServiceOption.fromFirestore(doc.data()!, doc.id);
  }
}