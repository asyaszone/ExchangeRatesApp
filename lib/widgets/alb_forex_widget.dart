import 'package:flutter/material.dart';
import 'package:kuyumcu_app/models/SubExchanges.dart';

class AlbForexWidget extends StatelessWidget {
  final List<SubExchange>? subExchanges;

  const AlbForexWidget({
    Key? key,
    this.subExchanges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: subExchanges?.map((subExchange) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        subExchange.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        subExchange.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
