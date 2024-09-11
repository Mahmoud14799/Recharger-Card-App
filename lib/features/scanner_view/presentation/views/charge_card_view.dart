import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Home/presentation/view/select_card_view.dart';
import 'package:flutter/material.dart';

class ChargeCardApp extends StatelessWidget {
  const ChargeCardApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: const SelectCardView(),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
