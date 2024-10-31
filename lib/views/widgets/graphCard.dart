import 'package:flutter/material.dart';

class GraphCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.3,
      child: Container(
        width: 150,
        height: 100,
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
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bar_chart, color: Colors.blue, size: 60),
              Icon(Icons.bar_chart, color: Colors.blue, size: 60),
            ],
          ),
        ),
      ),
    );
  }
}
