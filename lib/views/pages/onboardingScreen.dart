import 'package:findeel/views/pages/searchTickerPage.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import '../widgets/contractStatusCard.dart';
import '../widgets/graphCard.dart';
import '../widgets/signatureCard.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1E3A8A),
                  Color(0xFF5A75D7),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.1, 0.3, 0.6],
              ),
            ),
          ),

          const Positioned(
            top: 40,
            left: 16,
            child: Text(
              'FinDeel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 40,
            right: 16,
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2 - 280,
              right: MediaQuery.of(context).size.width / 2 - 160,
              child: Image.asset(
                'assets/images/arrow.png',
                width: 100,
                height: 100,
              )),
          // Cards
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 280,
            right: MediaQuery.of(context).size.width / 2 - 5,
            child: SignatureCard(),
          ),
          Positioned(
            top: 350,
            right: 30,
            child: GraphCard(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 160,
            left: MediaQuery.of(context).size.width / 2 - 130,
            child: ContractStatusCard(),
          ),
          Positioned(
            top: 400,
            left: 30,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: const Icon(Icons.add),
              ),
            ),
          ),

          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Column(
              children: [
                const Text(
                  'Plan Your Finances',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Control your finances with Deel. Plan your expenses, track your income, and manage your investments.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Searchtickerpage();
                    }));
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Center(
                        child: Text("Continue", textAlign: TextAlign.center)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
