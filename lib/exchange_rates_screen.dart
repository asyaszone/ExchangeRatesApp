import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kuyumcu_app/models/SubExchanges.dart';
import 'package:kuyumcu_app/widgets/widgets.dart';
import 'models/ExchangeRate.dart';
import 'services/api_service.dart';

class ExchangeRatesScreen extends StatefulWidget {
  const ExchangeRatesScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeRatesScreen> createState() => _ExchangeRatesScreenState();
}

class _ExchangeRatesScreenState extends State<ExchangeRatesScreen> {
  ExchangeRate? exchangeRate;
  List<Map<String, dynamic>> exchangeData = [];
  List<SubExchange>? subExchanges;

  @override
  void initState() {
    super.initState();
    ApiServices.startPeriodicRequest(_handleData);
    _fetchSubExchanges();
  }

  void _handleData(ExchangeRate data, List<SubExchange> subExchangesData) {
    setState(() {
      exchangeRate = data;

      exchangeData = [
        {
          'name': data.exchange1Name,
          'buying': data.exchange1Buying,
          'selling': data.exchange1Selling,
        },
        {
          'name': data.exchange2Name,
          'buying': data.exchange2Buying,
          'selling': data.exchange2Selling,
        },
        {
          'name': data.exchange3Name,
          'buying': data.exchange3Buying,
          'selling': data.exchange3Selling,
        },
        {
          'name': data.exchange4Name,
          'buying': data.exchange4Buying,
          'selling': data.exchange4Selling,
        },
        {
          'name': data.exchange5Name,
          'buying': data.exchange5Buying,
          'selling': data.exchange5Selling,
        },
        {
          'name': data.exchange6Name,
          'buying': data.exchange6Buying,
          'selling': data.exchange6Selling,
        },
      ];

      subExchanges = subExchangesData;
    });
  }

  Future<void> _fetchSubExchanges() async {
    try {
      final subExchangesData = await ApiServices.fetchSubExchanges();
      setState(() {
        subExchanges = subExchangesData;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching subExchanges: $error');
      }
    }
  }

  Widget _buildExchangeRateWidget(ExchangeRate data) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: HeaderWidget(branchName: data.branchName),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: 7,
          child: ExchangeRatesTableWidget(
            exchangeData: exchangeData,
            imageUrls: [data.photoLink, data.photoLink2, data.photoLink3],
          ),
        ),
        SizedBox(
          height: 40,
          child: MessageWidget(
            message: data.message.toUpperCase(),
          ),
        ),
        Expanded(
          flex: 1,
          child: AlbForexWidget(subExchanges: subExchanges),
        ),
        BottomInfoWidget(
          context: context,
          updateDate: data.updateDate,
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 95, 5, 1),
      body: exchangeRate != null
          ? _buildExchangeRateWidget(exchangeRate!)
          : _buildLoadingWidget(),
    );
  }
}
