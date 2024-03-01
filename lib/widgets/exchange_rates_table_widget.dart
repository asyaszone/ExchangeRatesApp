import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kuyumcu_app/widgets/grid_widget.dart';

class ExchangeRatesTableWidget extends StatelessWidget {
  const ExchangeRatesTableWidget({
    Key? key,
    required this.exchangeData,
    required this.imageUrls,
  }) : super(key: key);

  final List<Map<String, dynamic>> exchangeData;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CustomGridViewWidget(
              exchangeData: exchangeData,
            ),
          ),
          Expanded(
            flex: 1,
            child: CarouselSlider(
              items: imageUrls.map((imageUrl) {
                return Image.network(
                  imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 15),
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
