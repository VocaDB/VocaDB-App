enum DurationHours {
  daily(24),
  weekly(168),
  monthly(720);

  const DurationHours(this.value);
  final int value;
}
