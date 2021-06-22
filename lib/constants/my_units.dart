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
      UnitModal(name: 'Millimetres', unit: 'mm');
  static const UnitModal centimetre =
      UnitModal(name: 'Centimetres', unit: 'cm');
  static const UnitModal metre = UnitModal(name: 'Metres', unit: 'm');
  static const UnitModal kilometre = UnitModal(name: 'Kilometres', unit: 'km');
  static const UnitModal inch = UnitModal(name: 'Inches', unit: 'in');
  static const UnitModal feet = UnitModal(name: 'Feet', unit: 'ft');
  static const UnitModal yards = UnitModal(name: 'Yards', unit: 'yd');
  static const UnitModal miles = UnitModal(name: 'Miles', unit: 'mi');

  /// [UnitType.area] units
  static const UnitModal acre = UnitModal(name: 'Acres', unit: 'ac');
  static const UnitModal hectare = UnitModal(name: 'Hectares', unit: 'ha');
  static const UnitModal squareCentimetre =
      UnitModal(name: 'Square Centimetres', unit: 'cm²');
  static const UnitModal squareFeet =
      UnitModal(name: 'Square Feet', unit: 'ft²');
  static const UnitModal squareInch =
      UnitModal(name: 'Square Inches', unit: 'in²');
  static const UnitModal squaremetre =
      UnitModal(name: 'Square Metres', unit: 'm²');

  /// [UnitType.volume] units
  static const UnitModal gallon = UnitModal(name: 'Gallons', unit: 'gal');
  static const UnitModal litre = UnitModal(name: 'Litres', unit: 'l');
  static const UnitModal millilitre =
      UnitModal(name: 'Millilitres', unit: 'ml');
  static const UnitModal cubicCentimetre =
      UnitModal(name: 'Cubic Centimetres', unit: 'cm³');
  static const UnitModal cubicMetre =
      UnitModal(name: 'Cubic Metres', unit: 'm³');
  static const UnitModal cubicInch =
      UnitModal(name: 'Cubic Inches', unit: 'in³');
  static const UnitModal cubicFeet = UnitModal(name: 'Cubic Feet', unit: 'ft³');

  /// [UnitType.temperature] units
  static const UnitModal kelvin = UnitModal(name: 'Kelvin', unit: 'K');
  static const UnitModal fahrenheit = UnitModal(name: 'Fahrenheit', unit: '℉');
  static const UnitModal celcius = UnitModal(name: 'Celcius', unit: '℃');

  /// [UnitType.mass] units
  static const UnitModal ton = UnitModal(name: 'Tons', unit: 't');
  static const UnitModal pounds = UnitModal(name: 'Pounds', unit: 'lb');
  static const UnitModal ounces = UnitModal(name: 'Ounces', unit: 'oz');
  static const UnitModal kilograms = UnitModal(name: 'Kilograms', unit: 'kg');
  static const UnitModal grams = UnitModal(name: 'Grams', unit: 'g');

  /// [UnitType.data] units
  static const UnitModal bits = UnitModal(name: 'Bits', unit: 'b');
  static const UnitModal byte = UnitModal(name: 'Byte', unit: 'B');
  static const UnitModal kilobyte = UnitModal(name: 'Kilobyte', unit: 'KB');
  static const UnitModal megabyte = UnitModal(name: 'Megabyte', unit: 'MB');
  static const UnitModal gigabyte = UnitModal(name: 'Gigabyte', unit: 'GB');
  static const UnitModal terabyte = UnitModal(name: 'Terabyte', unit: 'TB');

  /// [UnitType.speed] units
  static const UnitModal mps =
      UnitModal(name: 'Metres per second', unit: 'm/s');
  static const UnitModal mph = UnitModal(name: 'Metres per hour', unit: 'm/h');
  static const UnitModal kmps =
      UnitModal(name: 'Kilometres per second', unit: 'km/s');
  static const UnitModal kmph =
      UnitModal(name: 'Kilometres per hour', unit: 'km/h');
  static const UnitModal ips =
      UnitModal(name: 'Inches per second', unit: 'in/s');
  static const UnitModal iph = UnitModal(name: 'Inches per hour', unit: 'in/h');
  static const UnitModal fps = UnitModal(name: 'Feet per second', unit: 'ft/s');
  static const UnitModal fph = UnitModal(name: 'Feet per hour', unit: 'ft/h');
  static const UnitModal mips =
      UnitModal(name: 'Miles per second', unit: 'mi/s');
  static const UnitModal miph = UnitModal(name: 'Miles per hour', unit: 'mi/h');

  /// [UnitType.time] units
  static const UnitModal millisecond =
      UnitModal(name: 'Milliseconds', unit: 'ms');
  static const UnitModal second = UnitModal(name: 'Seconds', unit: 's');
  static const UnitModal minute = UnitModal(name: 'Minutes', unit: 'min');
  static const UnitModal hour = UnitModal(name: 'Hours', unit: 'h');
  static const UnitModal day = UnitModal(name: 'Days', unit: 'd');
  static const UnitModal week = UnitModal(name: 'Weeks', unit: 'wk');
}
