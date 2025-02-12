import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_assessment/main.dart';

void main() {

  group('add function test', () {
    test('input string as ' ' empty', () {
      expect(Utils.add(''), equals(0));
    });

    test('input string as single digit', () {
      expect(Utils.add('2'), equals(2));
    });

    test('input string with two digit comma separated', () {
      expect(Utils.add('2,3'), equals(5));
    });

    test('input string with two digit separated with next line pattern', () {
      expect(Utils.add('2\n5'), equals(7));
    });

    test(
        'input string with two digit separated with multiple pattern i.e. next line and comma',
        () {
      expect(Utils.add('2\n6,9'), equals(17));
    });

    test('input string with two digit separated with custom single pattern',
        () {
      expect(Utils.add('//[;]\n1;2'), equals(3));
    });

    test('input string with two digit separated with custom n length pattern',
        () {
      expect(Utils.add('//[;@]\n1;@2;@5'), equals(8));
    });

    test(
        'input string with two digit separated with custom n different pattern',
        () {
      expect(Utils.add('//[;][@]\n1;2@5'), equals(8));
    });

    test('Throws exception for negative numbers', () {
      expect(() => Utils.add('//;\n1;-2;3'), throwsA(isA<Exception>()));
    });
  });
}
