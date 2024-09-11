import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/scanner_view/data/model/card_model.dart';
import 'show_snack_bar.dart';

Future<void> sendNumberToTel(
    String organizedText, BuildContext context, CardModel card) async {
  if (organizedText.isNotEmpty) {
    final String codeServicePart =
        card.codeService.isNotEmpty ? card.codeService : '';
    final Uri phoneNumber = Uri(
        path: "${card.cardCode}$codeServicePart$organizedText#", scheme: 'tel');
    if (await canLaunchUrl(phoneNumber)) {
      await launchUrl(phoneNumber);
    } else {
      if (context.mounted) {
        showSnackBar('لا يمكن فتح لوحة الاتصال للرقم: $organizedText', context);
      }
    }
  }
}
