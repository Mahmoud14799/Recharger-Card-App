import 'dart:io';

import 'package:charge_card/core/Utils/send_number_to_telpad.dart';
import 'package:charge_card/core/Utils/show_snack_bar.dart';
import 'package:charge_card/features/scanner_view/data/model/card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camera_scanner_state.dart';

class CameraScannerCubit extends Cubit<CameraScannerState> {
  CameraScannerCubit(this.card) : super(CameraScannerInitial());

  final TextRecognizer recognizedText = TextRecognizer();
  final ImagePicker picker = ImagePicker();
  File? _image;
  final CardModel card;
  Future<void> requestPermissionAndPickImageCamera(BuildContext context) async {
    final currentContext = context;
    try {
      final status = await Permission.storage.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        await Permission.storage.request();
      }
      if (status.isGranted) {
        final pickedImage = await picker.pickImage(source: ImageSource.camera);
        if (pickedImage != null) {
          final croppedImage = await ImageCropper().cropImage(
            sourcePath: pickedImage.path,
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'تحديد رقم الشحن',
                  toolbarColor: Colors.green,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.ratio16x9,
                  lockAspectRatio: false),
              IOSUiSettings(
                title: 'تحديد رقم الشحن',
                minimumAspectRatio: 1.0,
              ),
            ],
          );
          if (croppedImage != null) {
            _image = File(croppedImage.path);
            emit(OcrImagePicked(_image!));

            if (currentContext.mounted) {
              await _processImage(currentContext);
            }
          }
        }
      } else if (status.isDenied) {
        openAppSettings();
      } else if (currentContext.mounted) {
        showSnackBar('لا توجد أذونات للوصول إلى الصور', currentContext);
      }
    } catch (e) {
      if (currentContext.mounted) {
        showSnackBar('حدث خطاء اثناء اختيار الصورة: $e', currentContext);
      }
    }
  }

  Future<void> _processImage(BuildContext context) async {
    if (_image != null) {
      emit(const OcrProcessing(true));

      try {
        final inputImage = InputImage.fromFile(_image!);
        final requestText = await recognizedText.processImage(inputImage);

        if (context.mounted) {
          sendNumberToTel(requestText.text, context, card);
        }
        emit(OcrTextScanned(requestText.text));

        emit(const OcrProcessing(false));
      } catch (e) {
        if (context.mounted) {
          showSnackBar('لم يستطيع الحصول علي الرقم', context);
        }
      }
    }
  }

  @override
  Future<void> close() {
    recognizedText.close();
    return super.close();
  }
}
