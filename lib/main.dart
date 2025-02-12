class Utils {

  static int add(String numbers) {
    if (numbers.isEmpty) return 0;
    final numbersArray = _getNumberArray(numbers);

    final negativeNumbers = numbersArray.where((n) => n.isNegative).toList();
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
          'Negative numbers not allowed: ${negativeNumbers.join(", ")}');
    }
    return numbersArray.reduce((acc, curr) => acc + curr);
  }

  //method to get array of integers from a string
  static List<int> _getNumberArray(String numbers) {
    String delimiterPattern = ',|\n';

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      String customDelimiter = parts[0].substring(2);
      final delimiterRegex = RegExp(r'\[(.*?)\]');
      final delimiters = delimiterRegex
          .allMatches(customDelimiter)
          .map((m) => RegExp.escape(m.group(1)!))
          .toList();

      delimiterPattern = ',|\n|${delimiters.join('|')}';

      numbers = parts.sublist(1).join('\n');
    }
    return numbers.split(RegExp(delimiterPattern)).map(int.parse).toList();
  }
}
