import 'package:charge_card/features/scanner_view/presentation/manger/cubit/camera_scanner_cubit.dart';
import 'package:charge_card/features/scanner_view/presentation/views/widget/pick_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAndBodyCamera extends StatelessWidget {
  const ButtonAndBodyCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraScannerCubit, CameraScannerState>(
      builder: (context, state) {
        if (state is OcrProcessing && state.isProcessing) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickImageButton(
                onPressed: () => BlocProvider.of<CameraScannerCubit>(context)
                    .requestPermissionAndPickImageCamera(context),
                colorButton: Colors.yellow,
                icon: Icons.camera,
                textButton: ' التقاط صوره بالكاميرا',
              ),
              const SizedBox(height: 30),
              if (state is OcrImagePicked) ...[
                Image.file(state.image),
                const SizedBox(height: 20),
              ],
              if (state is OcrTextScanned) ...[
                Text(
                  'رقم الشحن: ${state.scannedText}',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
              if (state is OcrError) ...[
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
