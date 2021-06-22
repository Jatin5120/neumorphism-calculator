import 'package:get/get.dart';
import '../models/models.dart';
import '../constants/constants.dart';

class UnitController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt firstUnitIndex = 0.obs;
  RxInt secondUnitIndex = 1.obs;
  RxInt firstNumber = 1.obs;
  RxInt secondNumber = 1.obs;
  List<UnitModal> currentUnitType() => unitList[selectedIndex.value];
  Rx<UnitModal> firstUnit() => currentUnitType()[firstUnitIndex.value].obs;
  Rx<UnitModal> secondUnit() => currentUnitType()[secondUnitIndex.value].obs;

  changeUnitType(int index) {
    selectedIndex.value = index;
    firstUnitIndex.value = 0;
    secondUnitIndex.value = 1;
  }

  selectUnit(UnitModal unitModal, {bool changeFirst = false}) {
    if (changeFirst) {
      firstUnitIndex.value =
          currentUnitType().indexWhere((modal) => modal == unitModal);
    } else {
      secondUnitIndex.value =
          currentUnitType().indexWhere((modal) => modal == unitModal);
    }
  }
}
