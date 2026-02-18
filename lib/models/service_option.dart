class ServiceOption {
  final String serviceId;
  final String serviceName;
  final double price;

  const ServiceOption({
    required this.serviceId,
    required this.serviceName,
    required this.price,
  });

  factory ServiceOption.fromFirestore(Map<String, dynamic> data, String id) {
    return ServiceOption(
      serviceId: data['service_id'] ?? '',
      serviceName: data['service_name'] ?? '',
      price: data['price'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'service_name': serviceName, 'price': price};
  }
}
