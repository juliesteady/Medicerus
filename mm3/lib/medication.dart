class MedicationField {
  static final int id = 0;
  static final String prodID = 'ProductID';
  static final String prodNDC = 'ProductNDC';
  static final String prodTypeName = 'ProductTypeName';
  static final String proprietaryName = 'ProprietaryName';
  static final String nonproprietaryName =
      'NonProprietaryName'; //, multi-valued
  static final String dosageFormName = 'DosageFormName';
  static final String routeName = 'RouteName'; //multi-valued
  static final String marketCatName = 'MarketingCategoryName';
  static final String? labelerName = 'LabelerName';
  static final String substanceName = 'SubstanceName'; //multi-valued
  static final String strengthNumber =
      'Active_Numerator_Strength'; //multi-valued
  static final String strengthUnit = 'Active_Ingred_Unit'; //multi-valued
  static final int fillQuantity =
      0; //How much is in a bottle given by the pharmacy, need to know for refill reminders
  static final int refills = 0; //Number of times pharmacy will refill
  static final int prescribedDosage = 0; //How much to take for each intake
  static final String unit = ''; //ml, tablets?
  //static final frequency; //How often to take. NEED TO IMPLEMENT TODO
  static final String notes = '';
  //static final howoftentotake;    Julie is looking into it
  //don't see your drug here? Make your own medication form
  //display quicklist items
  //add from quicklist, go to form that asks for necessary information
  //Once info is added, medication object viewable on medview page
  //Medication data must be stored in user DB, DB needs to be created
  //can pin/unpin to dashboard

}

enum frequency {
  twicedaily,
  daily,
  everyotherday,
}
