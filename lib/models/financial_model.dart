class FinancialData {
  final String ticker;
  final double actualEps;
  final double estimatedEps;
  final double actualRevenue;
  final double estimatedRevenue;
  final String priceDate;

  FinancialData({
    required this.ticker,
    required this.actualEps,
    required this.estimatedEps,
    required this.actualRevenue,
    required this.estimatedRevenue,
    required this.priceDate,
  });

  factory FinancialData.fromJson(Map<String, dynamic> json) {
    return FinancialData(
      ticker: json['ticker'] as String? ?? 'Unknown',
      actualEps:
          (json['actual_eps'] != null ? json['actual_eps'].toDouble() : 0.0),
      estimatedEps: (json['estimated_eps'] != null
          ? json['estimated_eps'].toDouble()
          : 0.0),
      actualRevenue: (json['actual_revenue'] != null
          ? json['actual_revenue'].toDouble()
          : 0.0),
      estimatedRevenue: (json['estimated_revenue'] != null
          ? json['estimated_revenue'].toDouble()
          : 0.0),
      priceDate: json['pricedate'] as String? ?? 'Unknown Date',
    );
  }
}
