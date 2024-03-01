import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kuyumcu_app/exchange_rates_screen.dart';

//void main() => runApp(MyApp());
void main() {
  HttpOverrides.global = new MyHttpoverrides();
  runApp(MyApp());
}

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExchangeRatesScreen(),
    );
  }
}
