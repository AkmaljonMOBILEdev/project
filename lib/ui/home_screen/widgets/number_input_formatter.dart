import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove any non-numeric characters from the new value
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // If the cleaned text length is greater than 6, truncate it to 6 characters
    if (cleanedText.length > 6) {
      cleanedText = cleanedText.substring(0, 6);
    }

    // Parse the cleaned text as an integer and check if it's greater than 100000
    int number = int.tryParse(cleanedText) ?? 0;
    if (number > 100000) {
      cleanedText = '100000'; // Set to the maximum value allowed
    }

    // Create a new TextEditingValue with the cleaned text and selection
    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }
}
