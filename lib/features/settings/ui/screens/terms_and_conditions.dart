import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _isEnglish = true;
  final bool _hasAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEnglish ? 'Terms & Conditions' : 'الشروط والأحكام',
          style: TextStyles.font22MainBlue,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.translate,
              color: ColorsApp.darkBlue,
            ),
            onPressed: () {
              setState(() {
                _isEnglish = !_isEnglish;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Language Toggle Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'English',
                  style: _isEnglish
                      ? TextStyles.font14Black
                      : TextStyles.font14Gray,
                ),
                Switch(
                  value: _isEnglish,
                  activeColor: ColorsApp.darkBlue,
                  onChanged: (value) {
                    setState(() {
                      _isEnglish = value;
                    });
                  },
                ),
                Text(
                  'العربية',
                  style: !_isEnglish
                      ? TextStyles.font16Black
                      : TextStyles.font14Gray,
                ),
              ],
            ),
            verticalSpace(20),

            // Terms Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorsApp.mistyGrey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorsApp.lightGray),
                  ),
                  child:
                      _isEnglish ? _buildEnglishTerms() : _buildArabicTerms(),
                ),
              ),
            ),

            verticalSpace(20),

            // Acceptance Checkbox
            // Row(
            //   children: [
            //     Checkbox(
            //       value: _hasAccepted,
            //       activeColor: ColorsApp.darkBlue,
            //       onChanged: (value) {
            //         setState(() {
            //           _hasAccepted = value ?? false;
            //         });
            //       },
            //     ),
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _hasAccepted = !_hasAccepted;
            //           });
            //         },
            //         child: Text(
            //           _isEnglish
            //               ? 'I have read and accept the Terms & Conditions'
            //               : 'لقد قرأت الشروط والأحكام وأوافق عليها',
            //           style: TextStyles.font14Black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            verticalSpace(20),

            // Accept Button
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor:
            //           _hasAccepted ? ColorsApp.darkBlue : ColorsApp.gray,
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //     onPressed: _hasAccepted
            //         ? () {
            //             // Navigate back or proceed
            //             // context.pushNamed(Routes.onBoardingScreen);
            //           }
            //         : null,
            //     child: Text(
            //       _isEnglish ? 'Accept & Continue' : 'موافق ومتابعة',
            //       style: TextStyles.font16White,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnglishTerms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Acceptance of Terms',
          style: TextStyles.font14MainBlue,
        ),
        verticalSpace(8),
        Text(
          'By using this employment application ("App"), you agree to comply with and be bound by these Terms and Conditions. If you do not agree, please do not use the App.',
          style: TextStyles.font12DarkBlack,
        ),
        verticalSpace(15),

        Text(
          '2. Account Registration',
          style: TextStyles.font14MainBlue,
        ),

        verticalSpace(8),
        Text(
          '- You must provide accurate and complete information when creating an account',
          style: TextStyles.font12DarkBlack,
        ),
        verticalSpace(3),
        Text(
          ' You are solely responsible for maintaining the confidentiality of your account credentials',
          style: TextStyles.font12DarkBlack,
        ),
        verticalSpace(3),
        Text(
          '- You must notify us immediately of any unauthorized use of your account',
          style: TextStyles.font12DarkBlack,
        ),
        verticalSpace(15),

        // Add all other English terms here...

        Text(
          '3. Governing Law',
          style: TextStyles.font14MainBlue,
        ),
        const SizedBox(height: 8),
        Text(
          'These Terms shall be governed by the laws of your country.',
          style: TextStyles.font12DarkBlack,
        ),
      ],
    );
  }

  Widget _buildArabicTerms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '١. قبول الشروط',
          style: TextStyles.font22MainBlue,
          textAlign: TextAlign.right,
        ),
        verticalSpace(8),
        Text(
          'باستخدامك هذا التطبيق ("التطبيق")، فإنك توافق على الالتزام بهذه الشروط والأحكام. إذا لم توافق، يرجى عدم استخدام التطبيق.',
          style: TextStyles.font14Black,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 16),

        Text(
          '٢. طلبات التوظيف',
          style: TextStyles.font22MainBlue,
          textAlign: TextAlign.right,
        ),
        verticalSpace(8),
        Text(
          '- يجب أن تكون جميع المعلومات المقدمة في طلبات التوظيف صادقة وكاملة',
          style: TextStyles.font14Black,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        verticalSpace(3),
        Text(
          '- أي معلومات مزيفة أو مضللة قد تؤدي إلى إنهاء الحساب أو سحب فرص التوظيف',
          style: TextStyles.font14Black,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        verticalSpace(15),
        // Add all other Arabic terms here...

        Text(
          '٣. القانون الحاكم',
          style: TextStyles.font22MainBlue,
          textAlign: TextAlign.right,
        ),
        verticalSpace(3),

        Text(
          'تخضع هذه الشروط لقوانين بلدك.',
          style: TextStyles.font14Black,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
