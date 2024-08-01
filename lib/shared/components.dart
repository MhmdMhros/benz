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
