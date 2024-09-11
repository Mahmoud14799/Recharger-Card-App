import 'package:flutter/material.dart';

class PickImageButton extends StatelessWidget {
  const PickImageButton({
    super.key,
    required this.onPressed,
    required this.colorButton,
    this.icon,
    required this.textButton,
  });

  final Color colorButton;
  final void Function()? onPressed;
  final IconData? icon;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // تحسين الزوايا لجعلها أكثر عصريّة
        ),
        elevation: 5, // إضافة ظل لتحسين الظهور البصري
        shadowColor: Colors.black.withOpacity(0.2), // لون الظل
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 24.0, color: Colors.white), // لون الأيقونة
            const SizedBox(width: 8.0),
          ],
          Text(
            textButton,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white, // لون النص
              fontWeight: FontWeight.bold, // جعل النص غامقًا
            ),
          ),
        ],
      ),
    );
  }
}
