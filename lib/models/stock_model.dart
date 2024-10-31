class Stock {
  final String ticker;
  final String name;
  final double price;
  final String exchange;
  final String change;

  Stock({
    required this.ticker,
    required this.name,
    required this.price,
    required this.exchange,
    required this.change,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      price: json['price'] as double,
      exchange: json['exchange'] as String,
      change: json['change'] as String,
    );
  }
}
