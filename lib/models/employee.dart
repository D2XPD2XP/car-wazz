class Employee {
  final String employeeId;
  final String name;
  final String phoneNumber;

  const Employee({
    required this.employeeId,
    required this.name,
    required this.phoneNumber,
  });

  factory Employee.fromFirestore(Map<String, dynamic> data, String id) {
    return Employee(
      employeeId: data['employee_id'] ?? '',
      name: data['name'] ?? '',
      phoneNumber: data['phone_number'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'phone_number': phoneNumber};
  }
}
