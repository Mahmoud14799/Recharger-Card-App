import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:charge_card/features/scanner_view/presentation/views/orc_scanner_view1.dart';
import 'package:flutter/material.dart';

class RechargeMixedButton extends StatelessWidget {
  const RechargeMixedButton({super.key, required this.card});
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: const Icon(Icons.call, color: Colors.orange),
        title: const Text(
          'شحن مكالمات وانترنت ',
          style: TextStyle(
              fontSize: 16, color: Colors.orange, fontWeight: FontWeight.w700),
        ),
        onTap: () {
          card.codeService = '1*';
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OCRScanner(card: card);
          }));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text('تم اختيار شحن مكالمات وانتر نت  ${card.nameCard}'),
          ));
        },
      ),
    );
  }
}
