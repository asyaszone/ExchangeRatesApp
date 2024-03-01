import 'package:flutter/material.dart';

class CustomGridViewWidget extends StatelessWidget {
  final List<Map<String, dynamic>> exchangeData;

  const CustomGridViewWidget({Key? key, required this.exchangeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 200,
                height: 40,
                color: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                child: const Text(
                  'ÜRÜN',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 40,
                color: const Color.fromRGBO(69, 152, 43, 0.8),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'ALIŞ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 40,
                alignment: Alignment.centerRight,
                color: const Color.fromRGBO(29, 95, 5, 0.5),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: const Text(
                  'SATIŞ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Calculate the maximum height dynamically based on content
        for (int index = 0; index < exchangeData.length; index++)
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: index.isOdd ? Colors.grey.shade200 : Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        exchangeData[index]['name'] ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: index.isOdd
                        ? const Color.fromRGBO(69, 152, 43, 0.8)
                        : const Color.fromRGBO(69, 152, 43, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        exchangeData[index]['buying'].toString() == '0.00'
                            ? '---'
                            : exchangeData[index]['buying'].toString(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: index.isOdd
                        ? const Color.fromRGBO(29, 95, 5, 0.5)
                        : const Color.fromRGBO(29, 95, 5, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        exchangeData[index]['selling'].toString() == '0.00'
                            ? '---'
                            : exchangeData[index]['selling'].toString(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
