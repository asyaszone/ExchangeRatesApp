import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kuyumcu_app/models/SubExchanges.dart';
import 'dart:convert';
import 'dart:async';

import '../models/ExchangeRate.dart';

class ApiServices {
  static Future<ExchangeRate> fetchExchangeRate() async {
    final response = await http.get(
      Uri.parse(
        'https://goofy-blackburn.85-95-237-118.plesk.page/ExchangeRates/Get/1',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final exchangeRate = ExchangeRate.fromJson(data);

      return exchangeRate;
    } else {
      throw Exception('Failed to load exchange data');
    }
  }

  static Future<List<SubExchange>> fetchSubExchanges() async {
    final response = await http.get(
      Uri.parse(
        'https://goofy-blackburn.85-95-237-118.plesk.page/ExchangeRates/Get/1',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['subExchanges'];
      final subExchanges =
          data.map((item) => SubExchange.fromJson(item)).toList();

      return subExchanges;
    } else {
      throw Exception('Failed to load subExchanges data');
    }
  }

  static void startPeriodicRequest(
      void Function(ExchangeRate, List<SubExchange>) onDataReceived) {
    const Duration requestInterval = Duration(seconds: 2);

    void makeRequest() async {
      try {
        final exchangeRate = await fetchExchangeRate();
        final subExchanges = await fetchSubExchanges();
        onDataReceived(exchangeRate, subExchanges);
      } catch (error) {
        if (kDebugMode) {
          print('Error fetching data: $error');
        }
      } finally {
        Timer(requestInterval, () => makeRequest());
      }
    }

    makeRequest();
  }
}
