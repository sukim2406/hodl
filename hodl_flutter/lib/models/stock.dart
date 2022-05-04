class Stock {
  int? id;
  final String title;
  final String ticker;
  final int amount;
  final String avgPrice;

  Stock({
    this.id,
    required this.title,
    required this.ticker,
    required this.amount,
    required this.avgPrice,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      id: json['id'],
      title: json['title'],
      ticker: json['ticker'],
      amount: json['amount'],
      avgPrice: json['avgPrice'],
    );
  }

  dynamic toJson() => {
        'id': id,
        'title': title,
        'ticker': ticker,
        'amount': amount.toString(),
        'avgPrice': avgPrice,
      };
}
