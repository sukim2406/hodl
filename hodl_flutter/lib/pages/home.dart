import 'package:flutter/material.dart';
import 'package:hodl_flutter/api/api.dart';
import 'package:provider/provider.dart';

import '../pages/add_stock.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HODL - Diamond Handz'),
      ),
      body: ListView.builder(
        itemCount: stockProvider.stocks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete this stock ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            stockProvider
                                .deleteStock(stockProvider.stocks[index]);
                            Navigator.pop(context);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  });
            },
            child: ListTile(
              leading: Text(
                stockProvider.stocks[index].ticker,
              ),
              title: Text(
                stockProvider.stocks[index].title,
              ),
              subtitle: Text(
                stockProvider.stocks[index].amount.toString(),
              ),
              trailing: Text(
                stockProvider.stocks[index].avgPrice,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => AddStockPage()),
            ),
          );
        },
      ),
    );
  }
}
