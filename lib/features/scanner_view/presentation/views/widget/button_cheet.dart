import 'package:charge_card/core/Utils/costans.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showPersonalInfoBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true, // يسمح للـ BottomSheet بالتمدد إذا لزم الأمر
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'About Developer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // لون العنوان
                ),
              ),
            ),
            const SizedBox(height: 24), // زيادة المسافة بين العنوان والمحتوى
            const Row(
              children: [
                Icon(Icons.person, size: 40, color: Colors.blue),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Name : Mahmoud Badawy Hassn ',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.email, size: 40, color: Colors.red),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    ' Email : mahmoudbadawy723@gmail.com',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone_in_talk, size: 40, color: Colors.green),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Whatsapp : $phoneNumber',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  const url = 'https://wa.me/$phoneNumber?text=Hello';
                  final whatsappUrl = Uri.parse(url);

                  if (await canLaunchUrl(whatsappUrl)) {
                    await launchUrl(
                      whatsappUrl,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('لا يمكن فتح WhatsApp'),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'فتح WhatsApp',
                  style: TextStyle(fontSize: 18), // حجم الخط أكبر لزر WhatsApp
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(), // خط فاصل
            // روابط سياسة الخصوصية وشروط الاستخدام
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.blue),
              title: const Text('سياسة الخصوصية'),
              onTap: () async {
                final Uri privacyPolicyUrl = Uri.parse(
                  'https://www.freeprivacypolicy.com/live/2a20be92-52ca-4d14-b4d8-470364575427',
                );

                try {
                  if (await canLaunchUrl(privacyPolicyUrl)) {
                    await launchUrl(
                      privacyPolicyUrl,
                      mode: LaunchMode
                          .externalApplication, // فتح الرابط في تطبيق خارجي
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('لا يمكن فتح رابط سياسة الخصوصية'),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('خطأ: $e'),
                    ),
                  );
                }
              },
            ),

            ListTile(
              leading: const Icon(Icons.rule, color: Colors.blue),
              title: const Text('شروط الاستخدام'),
              onTap: () async {
                const termsOfServiceUrl =
                    'https://www.freeprivacypolicy.com/live/2a20be92-52ca-4d14-b4d8-470364575427';

                final url = Uri.parse(termsOfServiceUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('لا يمكن فتح رابط شروط الاستخدام'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
    },
  );
}
