class ServiceModel {
  final int? serviceID;
  late final String carNumber;
  late final String name;
  late final double price;
  late final double mileageChangeWhen;
  late final String startDate;

  ServiceModel(
      {this.serviceID,
      required this.carNumber,
      required this.name,
      required this.price,
      required this.startDate,
      required this.mileageChangeWhen});

  Map<String, dynamic> toMap() {
    return {
      'serviceID': serviceID,
      'carNumber': carNumber,
      'name': name,
      'price': price,
      'start_date': startDate,
      'mileageChangeWhen': mileageChangeWhen,
    };
  }
}
