import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/form_field_app_text.dart';
import 'package:jobizz/features/bot_chat/data/api_services/chat_services.dart';
import 'package:jobizz/features/bot_chat/data/model/chat_request.dart';
import 'package:jobizz/features/bot_chat/ui/widgets/ttping_indecator.dart';
import 'package:jobizz/core/cache/shared_pref.dart';

class GeminiChatScreen extends StatefulWidget {
  const GeminiChatScreen({super.key});

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late GeminiAPI _api;
  bool _isLoading = false;

  final String _apiKey = 'AIzaSyBTnPg0OqVr3T1C-HRmOfDzHqU8dRxLgXI';

  @override
  void initState() {
    super.initState();
    final dio = Dio();

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (value) => print(value),
      ),
    );
  
    _api = GeminiAPI(dio);
    _messages.add(
      {
        "role": "bot",
        "text": "Hello, ${SharedPrefHelper.getData(key: SharedPrefKeys.fullName)}aHow can I help you?",
      },
    );
  }

  void _startNewChat() {
    setState(() {
      _messages.clear();
      //  _addWelcomeMessage();
      _controller.clear();
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

    final request = GeminiRequest(
      contents: [
        Content(parts: [
          Part(text: text),
        ]),
      ],
    );

    try {
      final response = await _api.sendMessage(request, _apiKey);

      final reply = response.candidates!.first!.content?.parts?.first?.text;

      setState(() {
        _messages.add(
            {"role": "bot", "text": reply ?? "Not Found Please Try Again"});
      });
    } on DioException catch (e) {
      setState(() {
        _messages.add({
          "role": "bot",
          "text":
              "  Error in connection: ${e.response?.statusCode} - ${e.message}"
        });
      });
    } catch (e) {
      setState(() {
        _messages.add({"role": "bot", "text": "  : ${e.toString()}"});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Bot",
          style: TextStyles.font22DarkBlackBold,
        ),
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: ColorsApp.mainBlue,
            ),
            onPressed: _startNewChat,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0.w,
          vertical: 12.h,
        ),
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
                        msg['text'] ?? 'not found text ',
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
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
                      hintStyle: TextStyles.font14LightGray,
                      keyboardType: TextInputType.multiline,
                      controller: _controller,
                      hintText: 'write your message',
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
