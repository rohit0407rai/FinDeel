import 'package:flutter/material.dart';

class ContractStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/apple.png', width: 52),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apple Inc.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Gains: +5%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 15),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    bool isCompleted = index < 2;
                    Color dotColor = isCompleted ? Colors.blue : Colors.grey;

                    return Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: dotColor,
                          ),
                          child: Center(
                            child: isCompleted
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(width: 8),
                        if (index < 3)
                          Container(
                            width: 25,
                            height: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(5, (dotIndex) {
                                return Container(
                                  width: 3,
                                  height: 3,
                                  color: dotColor,
                                );
                              }),
                            ),
                          ),
                        SizedBox(width: 8),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
