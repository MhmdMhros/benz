import 'package:benz/shared/cache_helper.dart';

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
