import 'package:findeel/provider/earning_transcript_provider.dart';
import 'package:findeel/provider/financial_data_provider.dart';
import 'package:findeel/views/pages/onboardingScreen.dart';
import 'package:findeel/views/pages/searchTickerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FinancialDataProvider()),
        ChangeNotifierProvider(
            create: (context) => EarningTranscriptProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
