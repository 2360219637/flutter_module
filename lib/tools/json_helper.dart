class JsonHelper {
  JsonHelper._();

  ///反序列化时用来将值转换成String
  static String convertString(value) => value?.toString();

  static double stringToDouble(value) {
    if (value != null) {
      try {
        return double.parse(value.toString());
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  static int stringToInt(value) {
    if (value != null) {
      try {
        return int.parse(value.toString());
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }
}