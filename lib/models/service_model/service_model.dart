class ServiceModel {
  final int? serviceID;
  late final String carNumber;
  late final String name;
  late final double price;
  final double ? changeWhen;
  late final String startDate;


  ServiceModel({
    this.serviceID,
    required this.carNumber,
    required this.name,
    required this.price,
    required this.startDate,
     this.changeWhen
  
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceID': serviceID,
      'carNumber': carNumber,
      'name': name,
      'price': price,
      'start_date': startDate,
      'changeWhen': changeWhen,
      
    };
  }
}
