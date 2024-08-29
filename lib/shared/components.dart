import 'package:benz/generated/l10n.dart';
import 'package:flutter/material.dart';

String addSpaceBetweenEachLetter(String text) {
  String spacedText = '';
  for (int i = 0; i < text.length; i++) {
    spacedText += text[i];
    if (i < text.length - 1) {
      spacedText += ' ';
    }
  }
  return spacedText;
}

String password = "";

String serviceNavigation = "";

int currentIndexScreen = 0;

bool isAdmin = true;

String dropCheckDismissals(String text, BuildContext context) {
  if (text == 'Day') {
    return S.of(context).show_dismissals_dayHint;
  } else if (text == 'Month') {
    return S.of(context).show_dismissals_monthHint;
  } else {
    return S.of(context).show_dismissals_yearHint;
  }
}

String dropCheckServices(String text, BuildContext context) {
  if (text == 'Day') {
    return S.of(context).show_services_day;
  } else if (text == 'Month') {
    return S.of(context).show_services_month;
  } else {
    return S.of(context).show_services_year;
  }
}

String reverseArabicLetters(String input) {
  // List to store Arabic letters
  List<String> arabicLetters = [];

  // Collect Arabic letters from the input
  for (var char in input.runes) {
    if (char >= 0x0600 && char <= 0x06FF) {
      arabicLetters.add(String.fromCharCode(char));
    }
  }

  // Reverse the collected Arabic letters
  arabicLetters = arabicLetters.reversed.toList();

  // Reconstruct the new string with reversed Arabic letters
  StringBuffer result = StringBuffer();
  int arabicIndex = 0;

  for (var char in input.runes) {
    if (char >= 0x0600 && char <= 0x06FF) {
      result.write(arabicLetters[arabicIndex]);
      arabicIndex++;
    } else {
      result.write(String.fromCharCode(char));
    }
  }

  return result.toString();
}
