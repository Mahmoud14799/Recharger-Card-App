import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:charge_card/features/scanner_view/presentation/views/widget/button_and_body_camera.dart';
import 'package:charge_card/features/scanner_view/presentation/views/widget/button_and_body_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrcScannerBody extends StatelessWidget {
  const OrcScannerBody({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70.h),
        SvgPicture.asset(card.cardImage, width: 120.w, height: 120.h),
        SizedBox(height: 100.h),
        const ButtonAndBodyGallery(),
        SizedBox(height: 20.h),
        const ButtonAndBodyCamera(),
      ],
    );
  }
}
