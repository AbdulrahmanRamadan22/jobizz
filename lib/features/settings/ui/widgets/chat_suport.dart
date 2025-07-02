import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/app_text_form_field.dart';
import 'package:jobizz/features/bot_chat/ui/widgets/ttping_indecator.dart';
import 'package:jobizz/features/settings/data/api_servicec/chat_suport_api.dart';
import 'package:jobizz/features/settings/data/model/chat_support_request.dart';

class ChatSupport extends StatefulWidget {
  const ChatSupport({super.key});

  @override
  State<ChatSupport> createState() => _ChatSupportState();
}

class _ChatSupportState extends State<ChatSupport> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late ChatApi _api;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    _api = ChatApi(dio);
    _messages.add({
      "role": "bot",
      "text": "Hello! I'm Jobizz support bot. How can I assist you today?",
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": text});
      _controller.clear();
      _isLoading = true;
    });

    final request = ChatSupportRequest(message: text);

    try {
      final response = await _api.sendMessage(request);
      final reply = response.reply!.replaceFirst("Hi there!  ", "");

      setState(() {
        _messages.add(
            {"role": "bot", "text": reply ?? "Not Found Please Try Again"});
      });
    } catch (e) {
      setState(() {
        _messages.add({
          "role": "bot",
          "text": "⚠️ An error occurred. Please try again later."
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startNewChat() {
    setState(() {
      _messages.clear();
      _messages.add({
        "role": "bot",
        "text": "Hello! I'm Jobizz support bot. How can I assist you today?",
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support Chat", style: TextStyles.font22DarkBlackBold),
        backgroundColor: ColorsApp.backGroundWhite,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: ColorsApp.mainBlue),
            onPressed: _startNewChat,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isUser = msg['role'] == 'user';
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isUser ? ColorsApp.mainBlue : ColorsApp.mistyGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SelectableText(
                        msg['text'] ?? 'No message',
                        style: isUser
                            ? TextStyles.font14White
                            : TextStyles.font14Black,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorsApp.darkBlue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TypingIndicator(
                      dotSize: 8.w,
                      dotSpacing: 6.w,
                      dotColor: ColorsApp.whiteColor,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      maxLines: 4,
                      controller: _controller,
                      hintText: 'Write your message...',
                      hintStyle: TextStyles.font14LightGray,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {},
                    ),
                  ),
                  horizontalSpace(5),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: ColorsApp.darkBlue,
                      size: 30,
                    ),
                    onPressed: _isLoading ? null : _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
