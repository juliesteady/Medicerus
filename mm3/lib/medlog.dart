class MedLogFields {
  static final List<String?> values = [
    id.toString(),
    name,
    timetaken,
    prescriptionstatus.toString(),
    prescID.toString(),
    otcID.toString(),
    amounttaken.toString(),
    unit,
    substanceName,
  ];
  static final int id = 0;
  static final String name = 'name';
  static final String timetaken = 'timetaken';
  static final bool prescriptionstatus = false;
  static final int prescID = 0;
  static final int otcID = 0;
  static final int amounttaken = 0;
  static final String unit = ''; //ml, tablets?
  static final String? substanceName = 'SubstanceName'; //multi-valued
}

class MedLog {
  final int id;
  final String name;
  final String timetaken;
  final bool prescriptionstatus;
  final int? prescid;
  final int? otcid;
  final int amounttaken;
  final String unit; //ml, tablets?
  final String? substanceName; //multi-valued

  const MedLog(
      {required this.id,
      required this.name,
      required this.timetaken,
      required this.prescriptionstatus,
      this.prescid,
      this.otcid,
      required this.amounttaken,
      required this.unit,
      this.substanceName});
}
