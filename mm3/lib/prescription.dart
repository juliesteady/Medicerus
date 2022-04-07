class PrescriptionFields {
  static final List<String?> values = [
    id.toString(),
    name,
    totalAmount.toString(),
    unit,
    daySupply.toString(),
    reqAmountPerDay.toString(),
    rxNumber,
    fillDate.toString(),
    expDate.toString(),
    details,
    pharmPhoneNum,
    substanceName,
  ];
  static final int id = 0;
  static final String name = 'name';
  static final int totalAmount = 0;
  static final String unit = ''; //ml, tablets?
  static final int daySupply = 0;
  static final int reqAmountPerDay = 0;
  static final String? rxNumber = 'rxNum';
  static final DateTime fillDate = DateTime.now();
  static final DateTime? expDate = null;
  static final String? details = '';
  static final String? pharmPhoneNum = '';
  static final String? substanceName = 'SubstanceName'; //multi-valued
}

class Prescription {
  final int id;
  final String name;
  final int totalAmount;
  final String unit; //ml, tablets?
  final int daySupply;
  final int reqAmountPerDay;
  final String? rxNumber;
  final DateTime fillDate;
  final DateTime? expDate;
  final String? details;
  final String? pharmPhoneNum;
  final String? substanceName; //multi-valued

  const Prescription({
    required this.id,
    required this.name,
    required this.totalAmount,
    required this.unit,
    required this.daySupply,
    required this.reqAmountPerDay,
    this.rxNumber,
    required this.fillDate,
    this.expDate,
    this.details,
    this.pharmPhoneNum,
    this.substanceName,
  });
}

// enum frequency {
//   twicedaily,
//   daily,
//   everyotherday,
// }
