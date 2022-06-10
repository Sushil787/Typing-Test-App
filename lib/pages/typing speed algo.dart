double? grossTypingSpeed;
String checkTypingSpeed(String? typed) {
  grossTypingSpeed = ((typed!.length) / 5) / 0.5;
  return grossTypingSpeed.toString();
}
