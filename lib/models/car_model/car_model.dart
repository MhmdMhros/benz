class CarModel {
  final String carNumber;
  final String carModel;
  final String ownerName;
  final String phoneNumber;
  final double mileage;

  CarModel({
    required this.carNumber,
    required this.carModel,
    required this.ownerName,
    required this.phoneNumber,
    required this.mileage,
  });

  Map<String, dynamic> toMap() {
    return {
      'carNumber': carNumber,
      'carModel': carModel,
      'ownerName': ownerName,
      'phoneNumber': phoneNumber,
      'mileage': mileage,
    };
  }
}
