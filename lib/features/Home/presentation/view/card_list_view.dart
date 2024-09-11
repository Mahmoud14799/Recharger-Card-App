import 'package:charge_card/core/Utils/costans.dart';
import 'package:charge_card/features/Home/presentation/view/card_item.dart';
import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
  });

  String getCodeForCompany(String companyName) {
    return codeCompany[companyName] ?? 'لا يوجد كود شحن';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companyList.length,
      itemBuilder: (context, index) {
        final companyName = companyList[index];
        final cardCode = getCodeForCompany(companyName);

        final CardModel card = CardModel(
          cardImage: pathSvg[index],
          nameCard: companyName,
          cardCode: cardCode,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: CardItem(
            card: card,
            pathSvg: pathSvg[index],
          ),
        );
      },
    );
  }
}
