import 'package:charge_card/features/Home/presentation/view/widget/recharge_balance_button.dart';
import 'package:charge_card/features/Home/presentation/view/widget/recharge_mixed_button.dart';
import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:charge_card/core/Utils/color_name_card.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.card,
    required this.pathSvg,
  });
  final String pathSvg;
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.blue,
      collapsedIconColor: Colors.black,
      collapsedBackgroundColor: Colors.green[100],
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      tilePadding: const EdgeInsets.symmetric(
          horizontal: 16.0), // التحكم في المسافة حول العنوان
      childrenPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0), // التحكم في المسافة حول العناصر المنسدلة
      dense: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            pathSvg,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 20),
          Text(
            card.nameCard,
            style: TextStyle(
                fontSize: 20,
                color: colorNameCard(card.nameCard),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RechargeBalanceButton(card: card),
        RechargeMixedButton(card: card),
      ],
    );
  }
}
