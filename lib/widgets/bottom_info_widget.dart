import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomInfoWidget extends StatelessWidget {
  const BottomInfoWidget({
    super.key,
    required this.context,
    required this.updateDate,
  });

  final BuildContext context;
  final String updateDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'KUYUMCU ÇÖZÜMLERİ',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 8),
          ),
          const Text(
            'TAVSİYE EDİLEN ALTIN FİYATLARIDIR.',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 8),
          ),
          Text(
            'SAAT: ${DateFormat.Hms().format(DateTime.now())} / SON GÜNCELLEME: $updateDate',
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 8),
          ),
        ],
      ),
    );
  }
}
