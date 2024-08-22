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
