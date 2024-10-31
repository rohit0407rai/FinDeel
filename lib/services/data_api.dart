import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/financial_model.dart';
import '../models/earning_transcripts_model.dart';

class ApiService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  Future<Map<String, dynamic>> getStockData(String ticker) async {
    final url = '$baseUrl/stockprice?ticker=$ticker';

    try {
      final response =
          await http.get(Uri.parse(url), headers: {'X-Api-Key': apiKey});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List && data.isNotEmpty) {
          return data[0];
        } else if (data is Map<String, dynamic>) {
          return data;
        } else {
          throw Exception('Unexpected data format: $data');
        }
      } else {
        throw Exception('Failed to load stock data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching stock data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getMultipleStockData(
      List<String> tickers) async {
    List<Map<String, dynamic>> stocksData = [];

    for (String ticker in tickers) {
      final stockData = await getStockData(ticker);
      stocksData.add(stockData);
    }

    return stocksData;
  }

  Future<List<FinancialData>> fetchFinancialData(String ticker) async {
    try {
      print("Trying to fetch data for ticker: $ticker");
      final response = await http.get(
        Uri.parse('$baseUrl/earningscalendar?ticker=$ticker'),
        headers: {'X-Api-Key': apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print("This is data: $data");

        return data.map((json) {
          return FinancialData.fromJson(json);
        }).toList();
      } else {
        throw Exception(
            'Failed to load financial data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error loading financial data: $e");
      throw Exception('Error fetching financial data: $e');
    }
  }

  Future<EarningsTranscript?> fetchEarningsTranscript(
      String ticker, int year, int quarter) async {
    final url =
        'https://api.api-ninjas.com/v1/earningstranscript?ticker=$ticker&year=$year&quarter=$quarter';
    print("start earning scripting");

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'X-Api-Key': apiKey,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return EarningsTranscript.fromJson(data);
      } else {
        throw Exception("Failed to load transcript: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching earnings transcript: $e");
      return null;
    }
  }
}
