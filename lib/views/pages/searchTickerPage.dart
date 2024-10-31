import '../../services/commodities_data.dart';
import '../../services/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/financial_controller.dart';
import '../../provider/financial_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './searchResultsPage.dart';

class Searchtickerpage extends StatefulWidget {
  const Searchtickerpage({super.key});

  @override
  State<Searchtickerpage> createState() => _SearchtickerpageState();
}

class _SearchtickerpageState extends State<Searchtickerpage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'FinDeel',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: const Color(0xFF1E3A8A),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            // Search bar and button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          text = value; // Update search text
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search Ticker',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (text.isNotEmpty) {
                        // Navigate to the search results page with the search text
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchResultsPage(ticker: text),
                          ),
                        );
                      }
                    }, // Trigger navigation
                  ),
                ],
              ),
            ),
            // Initial UI (you can keep the popular stocks and commodities here)
            Expanded(child: buildUI()), // Show initial UI
          ],
        ),
      ),
    );
  }
}

Widget buildUI() {
  return SingleChildScrollView(
    child: Column(
      children: [
        // Popular Stocks section
        const Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Popular Stocks",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacer(),
            Text(
              "View All",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dummyStocks[index].ticker,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dummyStocks[index].name as String,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(dummyStocks[index].exchange),
                      Row(
                        children: [
                          Text(
                            dummyStocks[index].price.toString(),
                            style: TextStyle(
                              color: dummyStocks[index].change == "up"
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            dummyStocks[index].change == "up"
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: dummyCommodities[index].change == "up"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Commodities section
        const Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Commodities",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Spacer(),
            Text(
              "View All",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
            SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: dummyCommodities.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dummyCommodities[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dummyCommodities[index].exchange,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            dummyCommodities[index].price.toString(),
                            style: TextStyle(
                              color: dummyCommodities[index].change == "up"
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            dummyCommodities[index].change == "up"
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: dummyCommodities[index].change == "up"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
