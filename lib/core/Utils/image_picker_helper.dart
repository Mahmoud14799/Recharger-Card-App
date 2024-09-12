import 'dart:io';
import 'request_params.dart';
import 'show_snack_bar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<void> pickImageHelper(RequestParams param) async {
  final picker = ImagePicker();

  try {
    // اختيار الصورة من المعرض
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      try {
        // قص الصورة إذا تم اختيار واحدة
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'قص الصورة',
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              minimumAspectRatio: 1.0,
            ),
          ],
        );

        if (croppedFile != null) {
          // تحديث حالة الصورة وتأكيد صحة الكائن
          param.setState(() {
            param.image = File(croppedFile.path);
          });

          // معالجة الصورة بعد التأكد من وجودها
          await param.processImage(param.image!);
        }
      } catch (e) {
        // عرض رسالة خطأ في حال حدوث استثناء أثناء القص
        if (param.context.mounted) {
          showSnackBar('حدث خطأ أثناء قص الصورة: $e', param.context);
        }
      }
    } else {
      if (param.context.mounted) {
        showSnackBar('لم يتم اختيار أي صورة', param.context);
      }
    }
  } catch (e) {
    // عرض رسالة خطأ في حال حدوث استثناء أثناء اختيار الصورة
    if (param.context.mounted) {
      showSnackBar('حدث خطأ أثناء اختيار الصورة: $e', param.context);
    }
  }
}
