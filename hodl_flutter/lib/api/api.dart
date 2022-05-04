import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/stock.dart';

class StockProvider with ChangeNotifier {
  StockProvider() {
    fetchStocks();
  }

  List<Stock> _stocks = [];

  List<Stock> get stocks {
    return [..._stocks];
  }

  fetchStocks() async {
    final url = Uri.http('127.0.0.1:8000', 'apis/v1/');
    // final url = Uri.parse('http://127.0.0.1:8000/apis/v1/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _stocks = data.map<Stock>((json) => Stock.fromJson(json)).toList();
      notifyListeners();
    } else {
      print(response.statusCode);
    }
  }

  void addStock(Stock stock) async {
    final url = Uri.http('127.0.0.1:8000', 'apis/v1/');
    final response = await http.post(
      url,
      body: json.encode(stock),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      stock.id = json.decode(response.body)['id'];
      _stocks.add(stock);
      notifyListeners();
    } else {
      print(response.statusCode);
    }
  }
}
