class QuoteEntity {
  final List<int> volume;
  final List<double> close;
  final List<double> low;
  final List<double> high;
  final List<double> open;

  QuoteEntity({
    required this.volume,
    required this.close,
    required this.low,
    required this.high,
    required this.open,
  });
}
