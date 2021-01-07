String toSentence(String word) {
  String preTitle = word;
  String preTitle2 = preTitle.substring(1, preTitle.length);
  String newTitle = word[0] + preTitle2.toLowerCase();
  return newTitle;
}
