import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/earning_transcript_provider.dart';

class TranscriptPage extends StatefulWidget {
  final String ticker;
  final int year;
  final int quarter;

  const TranscriptPage(
      {Key? key,
      required this.ticker,
      required this.year,
      required this.quarter})
      : super(key: key);

  @override
  _TranscriptPageState createState() => _TranscriptPageState();
}

class _TranscriptPageState extends State<TranscriptPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<EarningTranscriptProvider>()
          .loadEarningsTranscript(widget.ticker, widget.year, widget.quarter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final transcriptProvider = context.watch<EarningTranscriptProvider>();

    if (transcriptProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final transcript = transcriptProvider.transcript;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Earnings Transcript',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: transcript != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                transcript.transcript,
                style: const TextStyle(fontSize: 14),
              ),
            )
          : const Center(child: Text('No transcript available')),
    );
  }
}
