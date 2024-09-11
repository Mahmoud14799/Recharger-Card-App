import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:charge_card/features/scanner_view/presentation/views/orc_scanner_view1.dart';
import 'package:flutter/material.dart';

class RechargeBalanceButton extends StatelessWidget {
  const RechargeBalanceButton({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: ListTile(
        leading: const Icon(Icons.account_balance_wallet, color: Colors.green),
        title: const Text(
          'شحن رصيد',
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OCRScanner(card: card);
          }));

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'تم اختيار شحن رصيد ${card.nameCard},',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ));
        },
      ),
    );
  }
}
