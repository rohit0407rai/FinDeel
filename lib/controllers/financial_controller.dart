import '../provider/financial_data_provider.dart';

class FinancialDataController {
  final FinancialDataProvider financialDataProvider;

  FinancialDataController(this.financialDataProvider);

  Future<void> fetchFinancialData(String ticker) async {
    print("calling laodData Function");
    await financialDataProvider.loadFinancialData(ticker);
  }
}
