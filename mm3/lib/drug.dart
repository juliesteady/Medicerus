//NDC (National Drug Code Directory) database information: https://www.fda.gov/drugs/drug-approvals-and-databases/ndc-product-file-definitions
//Below, actual in-database names are listed in comments along with any special conditions of each attribute.

final String tableNDCDrugs = 'drugs';

class DrugFields {
  static final List<String?> values = [
    id,
    prodNDC,
    prodTypeName,
    proprietaryName,
    proprietaryNameSuffix,
    nonproprietaryName,
    dosageFormName,
    routeName,
    startMarketDate,
    endMarketDate,
    marketCatName,
    applicationNum,
    labelerName,
    substanceName,
    strengthNumber,
    strengthUnit,
    pharmClasses,
    deaSchedule,
    ndcExcludeFlag,
    listingRecordCertifiedThrough
  ];
  static final String id = 'ProductID';
  static final String prodNDC = 'ProductNDC';
  static final String prodTypeName = 'ProductTypeName';
  static final String proprietaryName = 'ProprietaryName';
  static final String? proprietaryNameSuffix =
      'ProprietaryNameSuffix'; //nullable
  static final String nonproprietaryName =
      'NonProprietaryName'; //, multi-valued
  static final String dosageFormName = 'DosageFormName';
  static final String routeName = 'RouteName'; //multi-valued
  static final String startMarketDate = 'StartMarketingDate'; //[include format]
  static final String? endMarketDate =
      'EndMarketingDate'; //nullable, [include format]
  static final String marketCatName = 'MarketingCategoryName';
  static final String? applicationNum = 'ApplicationNumber'; //nullable
  static final String labelerName = 'LabelerName';
  static final String substanceName = 'SubstanceName'; //multi-valued
  static final String strengthNumber =
      'Active_Numerator_Strength'; //multi-valued
  static final String strengthUnit = 'Active_Ingred_Unit'; //multi-valued
  static final String pharmClasses = 'Pharm_Classes'; //multi-valued
  static final String deaSchedule = 'DEASchedule';
  static final String ndcExcludeFlag =
      'NDC_Exclude_Flag'; //check documentation for letter meanings
  static final String listingRecordCertifiedThrough =
      'Listing_Record_Certified_Through';
}

class Drug {
  final String id; //ProductID
  final String prodNDC; //ProductNDC
  final String prodTypeName; //ProductTypeName
  final String proprietaryName; //ProprietaryName
  final String? proprietaryNameSuffix; //ProprietaryNameSuffix, nullable
  final String nonproprietaryName; //NonProprietaryName, multi-valued
  final String dosageFormName; //DosageFormName
  final String routeName; //RouteName, multi-valued
  final String startMarketDate; //StartMarketingDate [include format]
  final String? endMarketDate; //EndMarketingDate, nullable [include format]
  final String marketCatName; //MarketingCategoryName
  final String? applicationNum; //ApplicationNumber, nullable
  final String labelerName; //LabelerName
  final String substanceName; //SubstanceName, multi-valued
  final String
      strengthNumber; //Active_Numerator_Strength, multi-valued **The documentation incorrectly calls it "StrengthNumber"
  final String
      strengthUnit; //Active_Ingred_Unit, multi-valued **The documentation incorrectly calls it "StrengthUnit"
  final String pharmClasses; //Pharm_Classes, multi-valued
  final String deaSchedule; //DEASchedule
  final String
      ndcExcludeFlag; //NDC_Exclude_Flag, check documentation for letter meanings
  final String listingRecordCertifiedThrough; //Listing_Record_Certified_Through

  const Drug(
      {required this.id,
      required this.prodNDC,
      required this.prodTypeName,
      required this.proprietaryName,
      this.proprietaryNameSuffix,
      required this.nonproprietaryName,
      required this.dosageFormName,
      required this.routeName,
      required this.startMarketDate,
      this.endMarketDate,
      required this.marketCatName,
      this.applicationNum,
      required this.labelerName,
      required this.substanceName,
      required this.strengthNumber,
      required this.strengthUnit,
      required this.pharmClasses,
      required this.deaSchedule,
      required this.ndcExcludeFlag,
      required this.listingRecordCertifiedThrough});

  Map<String, dynamic> toMap() {
    return {
      'PRODUCTID': id,
      'PRODUCTNDC': prodNDC,
      'PRODUCTTYPENAME': prodTypeName,
      'PROPRIETARYTYPENAME': proprietaryName,
      'PROPRIETARYNAMESUFFIX': proprietaryNameSuffix,
      'NONPROPRIETARYNAME': nonproprietaryName,
      'DOSAGEFORMNAME': dosageFormName,
      'ROUTENAME': routeName,
      'STARTMARKETINGDATE': startMarketDate,
      'ENDMARKETINGDATE': endMarketDate,
      'MARKETINGCATEGORYNAME': marketCatName,
      'APPLICATIONNUMBER': applicationNum,
      'LABELERNAME': labelerName,
      'SUBSTANCENAME': substanceName,
      'ACTIVE_NUMERATOR_STRENGTH': strengthNumber,
      'ACTIVE_INGRED_UNIT': strengthUnit,
      'PHARM_CLASSES': pharmClasses,
      'DEASCHEDULE': deaSchedule,
      'NDC_EXCLUDE_FLAG': ndcExcludeFlag,
      'LISTING_RECORD_CERTIFIED_THROUGH': listingRecordCertifiedThrough
    };
  }

  List<Drug> mapToObject(List<Map<String, dynamic>> list) {
    return List.generate(list.length, (i) {
      return Drug(
          id: list[i]['PRODUCTID'],
          prodNDC: list[i]['PRODUCTNDC'],
          prodTypeName: list[i]['PRODUCTTYPENAME'],
          proprietaryName: list[i]['PROPRIETARYTYPENAME'],
          proprietaryNameSuffix: list[i]['PROPRIETARYNAMESUFFIX'],
          nonproprietaryName: list[i]['NONPROPRIETARYNAME'],
          dosageFormName: list[i]['DOSAGEFORMNAME'],
          routeName: list[i]['ROUTENAME'],
          startMarketDate: list[i]['STARTMARKETINGDATE'],
          endMarketDate: list[i]['ENDMARKETINGDATE'],
          marketCatName: list[i]['MARKETINGCATEGORYNAME'],
          applicationNum: list[i]['APPLICATIONNUMBER'],
          labelerName: list[i]['LABELERNAME'],
          substanceName: list[i]['SUBSTANCENAME'],
          strengthNumber: list[i]['ACTIVE_NUMERATOR_STRENGTH'],
          strengthUnit: list[i]['ACTIVE_INGRED_UNIT'],
          pharmClasses: list[i]['PHARM_CLASSES'],
          deaSchedule: list[i]['DEASCHEDULE'],
          ndcExcludeFlag: list[i]['NDC_EXCLUDE_FLAG'],
          listingRecordCertifiedThrough: list[i]
              ['LISTING_RECORD_CERTIFIED_THROUGH']);
    });
  }

  @override
  String toString() {
    return ('PRODUCTID ' +
        id +
        ' PRODUCTNDC ' +
        prodNDC +
        ' PRODUCTTYPENAME ' +
        prodTypeName +
        ' PROPRIETARYNAME ' +
        proprietaryName +
        ' NONPROPRIETARYNAME ' +
        nonproprietaryName +
        ' DOSAGEFORMNAME ' +
        dosageFormName +
        ' ROUTENAME ' +
        routeName +
        ' STARTMARKETINGDATE ' +
        startMarketDate +
        ' MARKETINGCATEGORYNAME ' +
        marketCatName +
        ' LABELERNAME ' +
        labelerName +
        ' SUBSTANCENAME ' +
        substanceName +
        ' ACTIVE_NUMERATOR_STRENGTH ' +
        strengthNumber +
        ' ACTIVE_INGRED_UNIT ' +
        strengthUnit +
        ' PHARM_CLASSES ' +
        pharmClasses +
        ' DEASCHEDULE ' +
        deaSchedule +
        ' NDC_EXCLUDE_FLAG ' +
        ndcExcludeFlag +
        ' LISTING_RECORD_CERTIFIED_THROUGH ' +
        listingRecordCertifiedThrough);
  }
}
