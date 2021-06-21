import '../constants/constants.dart';
import '../models/models.dart';

class MyUnits {
  // Lists defined using the [UnitModal] defined below
  static const List<UnitModal> length = [
    millimetre,
    centimetre,
    metre,
    kilometre,
    inch,
    feet,
    yards,
    miles,
  ];
  static const List<UnitModal> area = [
    acre,
    hectare,
    squareCentimetre,
    squareFeet,
    squareInch,
    squaremetre,
  ];
  static const List<UnitModal> volume = [
    gallon,
    litre,
    millilitre,
    cubicCentimetre,
    cubicMetre,
    cubicInch,
    cubicFeet,
  ];
  static const List<UnitModal> temperature = [
    kelvin,
    fahrenheit,
    celcius,
  ];
  static const List<UnitModal> mass = [
    ton,
    pounds,
    ounces,
    kilograms,
    grams,
  ];
  static const List<UnitModal> data = [
    bits,
    byte,
    kilobyte,
    megabyte,
    gigabyte,
    terabyte,
  ];
  static const List<UnitModal> speed = [
    mps,
    mph,
    kmps,
    kmph,
    ips,
    iph,
    fps,
    fph,
    mips,
    miph,
  ];
  static const List<UnitModal> time = [
    millisecond,
    second,
    minute,
    hour,
    day,
    week,
  ];

  // ====================================================================
  // Modal Defined for all the units

  /// [UnitType.length] units
  static const UnitModal millimetre =
      UnitModal(name: 'Millimetres', unit: 'mm', unitType: UnitType.length);
  static const UnitModal centimetre =
      UnitModal(name: 'Centimetres', unit: 'cm', unitType: UnitType.length);
  static const UnitModal metre =
      UnitModal(name: 'Metres', unit: 'm', unitType: UnitType.length);
  static const UnitModal kilometre =
      UnitModal(name: 'Kilometres', unit: 'km', unitType: UnitType.length);
  static const UnitModal inch =
      UnitModal(name: 'Inches', unit: 'in', unitType: UnitType.length);
  static const UnitModal feet =
      UnitModal(name: 'Feet', unit: 'ft', unitType: UnitType.length);
  static const UnitModal yards =
      UnitModal(name: 'Yards', unit: 'yd', unitType: UnitType.length);
  static const UnitModal miles =
      UnitModal(name: 'Miles', unit: 'mi', unitType: UnitType.length);

  /// [UnitType.area] units
  static const UnitModal acre =
      UnitModal(name: 'Acres', unit: 'ac', unitType: UnitType.area);
  static const UnitModal hectare =
      UnitModal(name: 'Hectares', unit: 'ha', unitType: UnitType.area);
  static const UnitModal squareCentimetre = UnitModal(
      name: 'Square Centimetres', unit: 'cm²', unitType: UnitType.area);
  static const UnitModal squareFeet =
      UnitModal(name: 'Square Feet', unit: 'ft²', unitType: UnitType.area);
  static const UnitModal squareInch =
      UnitModal(name: 'Square Inches', unit: 'in²', unitType: UnitType.area);
  static const UnitModal squaremetre =
      UnitModal(name: 'Square Metres', unit: 'm²', unitType: UnitType.area);

  /// [UnitType.volume] units
  static const UnitModal gallon =
      UnitModal(name: 'Gallons', unit: 'gal', unitType: UnitType.volume);
  static const UnitModal litre =
      UnitModal(name: 'Litres', unit: 'l', unitType: UnitType.volume);
  static const UnitModal millilitre =
      UnitModal(name: 'Millilitres', unit: 'ml', unitType: UnitType.volume);
  static const UnitModal cubicCentimetre = UnitModal(
      name: 'Cubic Centimetres', unit: 'cm³', unitType: UnitType.volume);
  static const UnitModal cubicMetre =
      UnitModal(name: 'Cubic Metres', unit: 'm³', unitType: UnitType.volume);
  static const UnitModal cubicInch =
      UnitModal(name: 'Cubic Inches', unit: 'in³', unitType: UnitType.volume);
  static const UnitModal cubicFeet =
      UnitModal(name: 'Cubic Feet', unit: 'ft³', unitType: UnitType.volume);

  /// [UnitType.temperature] units
  static const UnitModal kelvin =
      UnitModal(name: 'Kelvin', unit: 'K', unitType: UnitType.temperature);
  static const UnitModal fahrenheit =
      UnitModal(name: 'Fahrenheit', unit: '℉', unitType: UnitType.temperature);
  static const UnitModal celcius =
      UnitModal(name: 'Celcius', unit: '℃', unitType: UnitType.temperature);

  /// [UnitType.mass] units
  static const UnitModal ton =
      UnitModal(name: 'Tons', unit: 't', unitType: UnitType.mass);
  static const UnitModal pounds =
      UnitModal(name: 'Pounds', unit: 'lb', unitType: UnitType.mass);
  static const UnitModal ounces =
      UnitModal(name: 'Ounces', unit: 'oz', unitType: UnitType.mass);
  static const UnitModal kilograms =
      UnitModal(name: 'Kilograms', unit: 'kg', unitType: UnitType.mass);
  static const UnitModal grams =
      UnitModal(name: 'Grams', unit: 'g', unitType: UnitType.mass);

  /// [UnitType.data] units
  static const UnitModal bits =
      UnitModal(name: 'Bits', unit: 'b', unitType: UnitType.data);
  static const UnitModal byte =
      UnitModal(name: 'Byte', unit: 'B', unitType: UnitType.data);
  static const UnitModal kilobyte =
      UnitModal(name: 'Kilobyte', unit: 'KB', unitType: UnitType.data);
  static const UnitModal megabyte =
      UnitModal(name: 'Megabyte', unit: 'MB', unitType: UnitType.data);
  static const UnitModal gigabyte =
      UnitModal(name: 'Gigabyte', unit: 'GB', unitType: UnitType.data);
  static const UnitModal terabyte =
      UnitModal(name: 'Terabyte', unit: 'TB', unitType: UnitType.data);

  /// [UnitType.speed] units
  static const UnitModal mps = UnitModal(
      name: 'Metres per second', unit: 'm/s', unitType: UnitType.speed);
  static const UnitModal mph =
      UnitModal(name: 'Metres per hour', unit: 'm/h', unitType: UnitType.speed);
  static const UnitModal kmps = UnitModal(
      name: 'Kilometres per second', unit: 'km/s', unitType: UnitType.speed);
  static const UnitModal kmph = UnitModal(
      name: 'Kilometres per hour', unit: 'km/h', unitType: UnitType.speed);
  static const UnitModal ips = UnitModal(
      name: 'Inches per second', unit: 'in/s', unitType: UnitType.speed);
  static const UnitModal iph = UnitModal(
      name: 'Inches per hour', unit: 'in/h', unitType: UnitType.speed);
  static const UnitModal fps = UnitModal(
      name: 'Feet per second', unit: 'ft/s', unitType: UnitType.speed);
  static const UnitModal fph =
      UnitModal(name: 'Feet per hour', unit: 'ft/h', unitType: UnitType.speed);
  static const UnitModal mips = UnitModal(
      name: 'Miles per second', unit: 'mi/s', unitType: UnitType.speed);
  static const UnitModal miph =
      UnitModal(name: 'Miles per hour', unit: 'mi/h', unitType: UnitType.speed);

  /// [UnitType.time] units
  static const UnitModal millisecond =
      UnitModal(name: 'Milliseconds', unit: 'ms', unitType: UnitType.time);
  static const UnitModal second =
      UnitModal(name: 'Seconds', unit: 's', unitType: UnitType.time);
  static const UnitModal minute =
      UnitModal(name: 'Minutes', unit: 'min', unitType: UnitType.time);
  static const UnitModal hour =
      UnitModal(name: 'Hours', unit: 'h', unitType: UnitType.time);
  static const UnitModal day =
      UnitModal(name: 'Days', unit: 'd', unitType: UnitType.time);
  static const UnitModal week =
      UnitModal(name: 'Weeks', unit: 'wk', unitType: UnitType.time);
}
