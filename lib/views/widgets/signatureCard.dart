import 'package:flutter/material.dart';

class SignatureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.3,
      child: Container(
        width: 150,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset('assets/images/sign.png', width: 60),
                const SizedBox(height: 10),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                      child: Text("Submit", textAlign: TextAlign.center)),
                )
              ],
            )),
      ),
    );
  }
}
