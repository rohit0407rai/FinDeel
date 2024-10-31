import 'package:findeel/controllers/earning_transcript_controller.dart';
import 'package:findeel/provider/earning_transcript_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../../models/financial_model.dart';
import '../../provider/financial_data_provider.dart';
import '../../controllers/financial_controller.dart';
import '../../models/financial_model.dart';
import './transcript_page.dart';

class SearchResultsPage extends StatefulWidget {
  final String ticker;

  const SearchResultsPage({Key? key, required this.ticker}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FinancialDataProvider>().loadFinancialData(widget.ticker);
    });
  }

  // Utility function to get quarter and year from date
  Map<String, dynamic> getQuarterAndYear(String date) {
    DateTime parsedDate = DateTime.parse(date);
    int year = parsedDate.year;
    int month = parsedDate.month;
    int quarter = ((month - 1) / 3).floor() + 1;

    return {"year": year, "quarter": quarter};
  }

  void _onDataPointTapped(int index) async {
    final provider = context.read<FinancialDataProvider>();
    final data = provider.financialData[index];
    final quarterAndYear = getQuarterAndYear(data.priceDate);
    final year = quarterAndYear["year"];
    final quarter = quarterAndYear["quarter"];
    String tickerName = widget.ticker;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TranscriptPage(ticker: tickerName, year: year, quarter: quarter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FinancialDataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.ticker,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                // Chart widget
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Earnings Chart",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        // Estimated Earnings Line
                        LineChartBarData(
                          spots: provider.financialData
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(entry.key.toDouble(),
                                  entry.value.estimatedEps))
                              .toList(),
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue.withOpacity(0.3)],
                          ),
                          barWidth: 3,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: true),
                        ),
                        // Actual Earnings Line
                        LineChartBarData(
                          spots: provider.financialData
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(
                                  entry.key.toDouble(), entry.value.actualEps))
                              .toList(),
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.green.withOpacity(0.3)
                            ],
                          ),
                          barWidth: 3,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: true),
                        ),
                      ],
                      // Enable interactivity
                      lineTouchData: LineTouchData(
                        touchCallback: (event, response) {
                          if (event.isInterestedForInteractions &&
                              response != null &&
                              response.lineBarSpots != null &&
                              response.lineBarSpots!.isNotEmpty) {
                            _onDataPointTapped(
                                response.lineBarSpots![0].x.toInt());
                          }
                        },
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Revenue Chart",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        // Estimated Revenue Line
                        LineChartBarData(
                          spots: provider.financialData
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(entry.key.toDouble(),
                                  entry.value.estimatedRevenue))
                              .toList(),
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue.withOpacity(0.3)],
                          ),
                          barWidth: 3,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: true),
                        ),
                        // Actual Revenue Line
                        LineChartBarData(
                          spots: provider.financialData
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(entry.key.toDouble(),
                                  entry.value.actualRevenue))
                              .toList(),
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.green.withOpacity(0.3)
                            ],
                          ),
                          barWidth: 3,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: true),
                        ),
                      ],
                      // Enable interactivity
                      lineTouchData: LineTouchData(
                        touchCallback: (event, response) {
                          if (event.isInterestedForInteractions &&
                              response != null &&
                              response.lineBarSpots != null &&
                              response.lineBarSpots!.isNotEmpty) {
                            _onDataPointTapped(
                                response.lineBarSpots![0].x.toInt());
                          }
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                // List view of detailed data below the chart
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.financialData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider.financialData[index].ticker,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(height: 8),
                          Text(
                            provider.financialData[index].priceDate,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Est. Revenue: ${provider.financialData[index].estimatedRevenue}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Act. EPS: ${provider.financialData[index].actualEps}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Est. EPS: ${provider.financialData[index].estimatedEps}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Actual Revenue: ${provider.financialData[index].actualRevenue}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
