import 'package:guide_app/src/domain/entities/quote_entity.dart';

class ActiveEntity {
  final String? symbol;
  final String? currency;
  final int? regularMarketTime;
  final double? regularMarketPrice;
  final double? chartPreviousClose;
  final double? previousClose;
  final List<int>? timestamp;
  final List<QuoteEntity>? quotes;

  ActiveEntity({
    this.symbol,
    this.currency,
    this.regularMarketTime,
    this.regularMarketPrice,
    this.chartPreviousClose,
    this.previousClose,
    this.timestamp,
    this.quotes,
  });
}
