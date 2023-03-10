import 'package:guide_app/src/data/models/quote_model.dart';
import 'package:guide_app/src/domain/entities/active_entity.dart';

class ActiveModel extends ActiveEntity {
  ActiveModel({
    required String symbol,
    required String currency,
    required int regularMarketTime,
    required double regularMarketPrice,
    required double chartPreviousClose,
    required double previousClose,
    required List<int> timestamp,
    required List<QuoteModel> quotes,
  }) : super(
          symbol: symbol,
          currency: currency,
          regularMarketTime: regularMarketTime,
          regularMarketPrice: regularMarketPrice,
          chartPreviousClose: chartPreviousClose,
          previousClose: previousClose,
          timestamp: timestamp,
          quotes: quotes,
        );

  factory ActiveModel.fromJson(Map<String, dynamic> json) {
    final metaJson = json['chart']['result'][0]['meta'];
    final timestampJson = json['chart']['result'][0]['timestamp'];
    final quoteJson = json['chart']['result'][0]['indicators']['quote'];

    return ActiveModel(
      symbol: metaJson['symbol'],
      currency: metaJson['currency'],
      regularMarketTime: metaJson['regularMarketTime'],
      regularMarketPrice: metaJson['regularMarketPrice'],
      chartPreviousClose: metaJson['chartPreviousClose'],
      previousClose: metaJson['previousClose'],
      timestamp: List<int>.from(timestampJson),
      quotes: QuoteModel.fromJsonList(quoteJson),
    );
  }
}
