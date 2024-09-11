import 'dart:io';

import 'package:flutter/material.dart';

class RequestParams {
  RequestParams({
    required this.context,
    required this.setState,
    required this.processImage, // استلام processImage هنا
    required this.image,
  });
  final BuildContext context;
  final Function setState;
  final Function(File) processImage;
  // إضافة processImage هنا
  File? image;
}
