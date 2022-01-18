
class ParserService {
  static List<String> parseString(String input, String seperator) {
    List<String> result = input.split(seperator);
    return result;
  }
}