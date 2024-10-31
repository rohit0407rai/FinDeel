import 'package:findeel/provider/earning_transcript_provider.dart';

class EarningTranscriptController {
  final EarningTranscriptProvider _provider;

  EarningTranscriptController(this._provider);

  void loadEarningsTranscript(String ticker, int year, int quarter) {
    _provider.loadEarningsTranscript(ticker, year, quarter);
  }
}
