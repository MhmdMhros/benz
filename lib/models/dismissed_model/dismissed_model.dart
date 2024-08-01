class DismissedModel {
  final String dismissedId;
  final String date;
  final String cost;
  final String titleName;
  final String note;

  DismissedModel({
    required this.dismissedId,
    required this.date,
    required this.cost,
    required this.titleName,
    required this.note,
  });

  // Method to convert DismissedModel to a map
  Map<String, dynamic> toMap() {
    return {
      'dismissedId': dismissedId,
      'date': date,
      'cost': cost,
      'titleName': titleName,
      'note': note,
    };
  }

  // Method to create a DismissedModel from a map
  factory DismissedModel.fromMap(Map<String, dynamic> map) {
    return DismissedModel(
      dismissedId: map['dismissedId'],
      date: map['date'],
      cost: map['cost'],
      titleName: map['titleName'],
      note: map['note'],
    );
  }
}
