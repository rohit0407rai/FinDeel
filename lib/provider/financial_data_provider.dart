
import 'package:flutter/material.dart';
import '../models/financial_model.dart';
import '../services/data_api.dart';

class FinancialDataProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<FinancialData> _financialData = [];
  bool _isLoading = false;

  List<FinancialData> get financialData => _financialData;
  bool get isLoading => _isLoading;

  // Fetch data and notify listeners
  Future<void> loadFinancialData(String ticker) async {
    _isLoading = true;
    notifyListeners();

    try {
      _financialData = await _apiService.fetchFinancialData(ticker);
    } catch (e) {
      print('Error loading financial data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
