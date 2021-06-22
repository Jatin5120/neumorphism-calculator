import 'package:get/get.dart';
import '../models/models.dart';
import '../constants/constants.dart';

class UnitController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxInt firstUnitIndex = 0.obs;
  RxInt secondUnitIndex = 1.obs;

  RxString firstNumber = '1'.obs;
  RxDouble secondNumber = 1.0.obs;

  String get firstText => firstNumber.value;
  String get secondText => secondNumber.value.toString();

  double get intermediateNumber => double.parse(firstText);

  int get numberLength => firstNumber.value.length;

  List<UnitModal> get currentUnitType => unitList[selectedIndex.value];

  UnitModal get firstUnit => currentUnitType[firstUnitIndex.value];
  UnitModal get secondUnit => currentUnitType[secondUnitIndex.value];

  RxString get firstUnitType => firstUnit.unit.obs;
  RxString get secondUnitType => secondUnit.unit.obs;

  set setFirstNumber(String number) => firstNumber.value = number;

  backButton() {
    if (numberLength == 1)
      setFirstNumber = '0';
    else
      setFirstNumber = firstNumber.substring(0, numberLength - 1);
    convertValue();
  }

  changeUnitType(int index) {
    selectedIndex.value = index;
    firstUnitIndex.value = 0;
    secondUnitIndex.value = 1;
    setFirstNumber = '1';
    convertValue();
  }

  selectUnit(UnitModal unitModal, {bool changeFirst = false}) {
    if (changeFirst) {
      firstUnitIndex.value =
          currentUnitType.indexWhere((modal) => modal == unitModal);
    } else {
      secondUnitIndex.value =
          currentUnitType.indexWhere((modal) => modal == unitModal);
    }
    convertValue();
  }

  convertValue() {
    double conversionalValue = conversionList[selectedIndex.value]
        [firstUnitType.value]![secondUnitType.value]!;
    print(intermediateNumber);
    secondNumber.value = conversionalValue * intermediateNumber;
  }
}
