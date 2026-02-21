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
      serviceId: id,
      serviceName: data['service_name'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'service_name': serviceName, 'price': price};
  }
}
