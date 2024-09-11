import 'package:charge_card/features/scanner_view/presentation/views/widget/button_cheet.dart';

import 'card_list_view.dart';
import 'package:flutter/material.dart';

class SelectCardView extends StatelessWidget {
  const SelectCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => showPersonalInfoBottomSheet(context),
            icon: const Icon(Icons.info_outline)),
        toolbarHeight: 80,

        title: const Text(
          'اشحن كارتك',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
            255, 12, 42, 14), // اختر اللون المناسب لخلفية AppBar
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: CardListView(),
      )),
    );
  }
}
