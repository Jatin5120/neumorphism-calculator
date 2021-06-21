import 'package:get/get.dart';
import '../models/models.dart';
import '../constants/constants.dart';

class UnitController extends GetxController {
  Rx<UnitType> unitType = UnitType.length.obs;
  Rx<UnitModal> firstUnit = MyUnits.millimetre.obs;
  Rx<UnitModal> secondUnit = MyUnits.centimetre.obs;

  List<UnitModal> activeList() {
    switch (unitType.value) {
      case UnitType.length:
        return MyUnits.length;
      case UnitType.area:
        return MyUnits.area;
      case UnitType.volume:
        return MyUnits.volume;
      case UnitType.temperature:
        return MyUnits.temperature;
      case UnitType.mass:
        return MyUnits.mass;
      case UnitType.data:
        return MyUnits.data;
      case UnitType.speed:
        return MyUnits.speed;
      case UnitType.time:
        return MyUnits.time;
    }
  }
}
