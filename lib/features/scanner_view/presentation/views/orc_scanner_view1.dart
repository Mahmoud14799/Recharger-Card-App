import 'package:charge_card/features/scanner_view/presentation/manger/cubit/camera_scanner_cubit.dart';
import 'package:charge_card/features/scanner_view/presentation/manger/gallery_scanner_cubit/gallery_scanner_cubit.dart';
import 'package:charge_card/features/scanner_view/presentation/views/orc_scanner_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/card_model.dart';
import 'package:flutter/material.dart';

class OCRScanner extends StatelessWidget {
  const OCRScanner({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GalleryScannerCubit(card),
        ),
        BlocProvider(
          create: (context) => CameraScannerCubit(card),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 12, 42, 14), // اختر اللون المناسب لخلف
          toolbarHeight: 80,
          title: const Text(
            'طريقه شحن الكارت ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: OrcScannerBody(
          card: card,
        ),
      ),
    );
  }
}
