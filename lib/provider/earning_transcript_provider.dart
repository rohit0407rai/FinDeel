

import 'package:flutter/material.dart';
import '../services/data_api.dart';
import '../models/earning_transcripts_model.dart';

class EarningTranscriptProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  EarningsTranscript? _transcript;
  bool _isLoading = false;

  EarningsTranscript? get transcript => _transcript;
  bool get isLoading => _isLoading;

  Future<void> loadEarningsTranscript(
      String ticker, int year, int quarter) async {
    _isLoading = true;
    notifyListeners();

    try {
      _transcript =
          await _apiService.fetchEarningsTranscript(ticker, year, quarter);
    } catch (error) {
      print("Error fetching transcript: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
