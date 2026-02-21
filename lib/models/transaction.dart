import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String transactionId;
  final String employeeId;
  final String serviceId;
  final String plateNumber;
  final VehicleTypeEnum vehicleType;
  final String vehicleName;
  final DateTime date;
  final double totalAmount;

  const TransactionModel({
    required this.transactionId,
    required this.employeeId,
    required this.serviceId,
    required this.plateNumber,
    required this.vehicleType,
    required this.vehicleName,
    required this.date,
    required this.totalAmount,
  });

  factory TransactionModel.fromFirestore(Map<String, dynamic> data, String id) {
    return TransactionModel(
      transactionId: data['transaction_id'] ?? id,
      employeeId: data['employee_id'] ?? '',
      serviceId: data['service_id'] ?? '',
      plateNumber: data['plate_number'] ?? '',
      vehicleType: VehicleTypeEnum.values.firstWhere(
        (e) => e.name == data['vehicle_type'],
        orElse: () => VehicleTypeEnum.car,
      ),
      vehicleName: data['vehicle_name'] ?? '',
      date: data['date'] is Timestamp
          ? (data['date'] as Timestamp).toDate()
          : data['date'],
      totalAmount: (data['total_amount'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'employee_id': employeeId,
      'service_id': serviceId,
      'plate_number': plateNumber,
      'vehicle_type': vehicleType.name,
      'vehicle_name': vehicleName,
      'date': date,
      'total_amount': totalAmount,
    };
  }
}
