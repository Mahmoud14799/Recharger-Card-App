import 'package:charge_card/features/scanner_view/presentation/manger/gallery_scanner_cubit/gallery_scanner_cubit.dart';
import 'package:charge_card/features/scanner_view/presentation/views/widget/pick_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAndBodyGallery extends StatelessWidget {
  const ButtonAndBodyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryScannerCubit, GalleryScannerState>(
      builder: (context, state) {
        if (state is OcrProcessing && state.isProcessing) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickImageButton(
                onPressed: () => BlocProvider.of<GalleryScannerCubit>(context)
                    .requestPermissionAndPickImageGallery(context),
                colorButton: Colors.blueAccent,
                icon: Icons.image,
                textButton: 'اختيار صورة من المعرض',
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
