import 'image_picker_helper.dart';
import 'request_params.dart';
import 'show_snack_bar.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissionAndPickImage(RequestParams param) async {
  try {
    PermissionStatus status = await Permission.storage.status;

    // تحقق من حالة الإذن وتحديثه إذا كان مرفوضاً
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.storage.request();
    }

    // إذا تم منح الإذن، قم بمتابعة العملية
    if (status.isGranted) {
      await pickImageHelper(param);
    }
    // إذا تم رفض الإذن بشكل دائم، افتح إعدادات التطبيق
    else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    // إذا لم يكن الإذن ممنوحاً، تحقق مما إذا كان `BuildContext` لا يزال صالحًا قبل إظهار الـ `SnackBar`
    else if (param.context.mounted) {
      showSnackBar('لا توجد أذونات للوصول إلى الصور', param.context);
    }
  } catch (e) {
    // تحقق من `BuildContext` قبل إظهار أي رسائل
    if (param.context.mounted) {
      showSnackBar('حدث خطأ أثناء اختيار الصورة: $e', param.context);
    }
  }
}
