import '../models/models.dart';
import 'constants.dart';

final List<String> chipList = ['Calculator', 'Unit'];

final List<String> unitNames = [
  'Length',
  'Area',
  'Volume',
  'Temperature',
  'Mass',
  'Data',
  'Speed',
  'Time',
];

final List<List<UnitModal>> unitList = [
  MyUnits.length,
  MyUnits.area,
  MyUnits.volume,
  MyUnits.temperature,
  MyUnits.mass,
  MyUnits.data,
  MyUnits.speed,
  MyUnits.time,
];

final List<Map<String, Map<String, double>>> conversionList = [
  UnitConversion.length,
  UnitConversion.area,
  UnitConversion.volume,
  UnitConversion.temperature,
  UnitConversion.mass,
  UnitConversion.data,
  UnitConversion.speed,
  UnitConversion.time,
];

final List<ButtonModal> calculatorButtons = [
  ButtonModal(text: MyButtons.clear, buttonType: ButtonType.clear),
  ButtonModal(text: MyButtons.percent, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.power, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.root, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.seven, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.eight, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.nine, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.add, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.four, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.five, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.six, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.subtract, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.one, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.two, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.three, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.multiply, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.dot, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.zero, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.equal, buttonType: ButtonType.operator),
  ButtonModal(text: MyButtons.divide, buttonType: ButtonType.operator),
];

final List<ButtonModal> unitButtons = [
  ButtonModal(text: MyButtons.seven, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.eight, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.nine, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.four, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.five, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.six, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.one, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.two, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.three, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.dot, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.zero, buttonType: ButtonType.number),
  ButtonModal(text: MyButtons.clear, buttonType: ButtonType.clear),
];
