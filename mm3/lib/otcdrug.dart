class OTCDrugFields {
  static final List<String?> values = [
    id.toString(),
    name,
    recAmount.toString(), //recommended Amount
    unit,
    recTime.toString(),
    recTimeType,
    details,
    substanceName,
  ];
  static final int id = 0;
  static final String name = 'name';
  static final int recAmount = 0;
  static final String unit = ''; //ml, tablets?
  static final int recTime = 0; //amount of hours/days, etc.
  static final String recTimeType = ''; //hours/days/weeks, etc.
  static final String? details = '';
  static final String? substanceName = 'SubstanceName'; //multi-valued
}

class OTCDrug {
  final int id;
  final String name;
  final int recAmount;
  final String unit; //ml, tablets?
  final int recTime; //amount of hours/days, etc.
  final String recTimeType; //hours/days/weeks, etc.
  final String? details;
  final String? substanceName; //multi-valued

  const OTCDrug(
      {required this.id,
      required this.name,
      required this.recAmount,
      required this.unit,
      required this.recTime,
      required this.recTimeType,
      this.details,
      this.substanceName});
}
