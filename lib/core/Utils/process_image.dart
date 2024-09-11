import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../features/scanner_view/data/model/card_model.dart';
import 'send_number_to_telpad.dart';

Future<void> processImage(
    CardModel card,
    BuildContext context,
    TextRecognizer textRecognizer,
    File image,
    Function(String) onTextScanned,
    Function(bool) onProcessingChanged) async {
  onProcessingChanged(true);

  try {
    final inputImage = InputImage.fromFile(image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    final String organizedText =
        recognizedText.text.replaceAll(RegExp(r'\s+'), '');

    if (context.mounted) {}

    if (context.mounted) {
      onTextScanned(organizedText.isNotEmpty
          ? organizedText
          : 'لم يتم العثور على رقم شحن');

      onProcessingChanged(false);

      await sendNumberToTel(organizedText, context, card);
    }
  } catch (e) {
    if (context.mounted) {
      onTextScanned('حدث خطأ أثناء معالجة الصورة: $e');
      onProcessingChanged(false);
    }
  }
}
