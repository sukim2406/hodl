import 'package:flutter/material.dart';
import 'package:hodl_flutter/api/api.dart';
import 'package:provider/provider.dart';

import '../models/stock.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({Key? key}) : super(key: key);

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController tickerController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController avgPriceController = TextEditingController();

  void onAdd() {
    if (titleController.text.isNotEmpty &&
        tickerController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        avgPriceController.text.isNotEmpty) {
      final Stock stock = Stock(
          title: titleController.text,
          ticker: tickerController.text,
          amount: int.parse(amountController.text),
          avgPrice: avgPriceController.text);
      Provider.of<StockProvider>(context, listen: false).addStock(stock);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add stock'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ticker',
                ),
                controller: tickerController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
                controller: amountController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Avg Price',
                ),
                controller: avgPriceController,
              ),
              ElevatedButton(
                onPressed: () {
                  onAdd();
                  Navigator.pop(context);
                },
                child: const Text('add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
