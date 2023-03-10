import 'dart:math';

import 'package:guide_app/src/domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  QuoteModel({
    required List<int> volume,
    required List<double> close,
    required List<double> low,
    required List<double> high,
    required List<double> open,
  }) : super(
          volume: volume,
          close: close,
          low: low,
          high: high,
          open: open,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      volume: json['volume'].cast<int>(),
      close: json['close'].cast<double>(),
      low: json['low'].cast<double>(),
      high: json['high'].cast<double>(),
      open: json['open'].cast<double>(),
    );
  }

  static List<QuoteModel> fromJsonList(List<dynamic> json) {
    return List<QuoteModel>.from(
      json.map((value) => QuoteModel.fromJson(value)),
    );
  }
}

double dp(double val, int places) {
  num mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}
