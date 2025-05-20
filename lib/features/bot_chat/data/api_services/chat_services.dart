import 'package:dio/dio.dart';
import 'package:jobizz/features/bot_chat/data/model/chat_request.dart';
import 'package:jobizz/features/bot_chat/data/model/chat_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'chat_services.g.dart';

@RestApi(baseUrl: "https://generativelanguage.googleapis.com/v1/")
abstract class GeminiAPI {
  factory GeminiAPI(Dio dio, {String baseUrl}) = _GeminiAPI;

  @POST("models/gemini-2.0-flash-001:generateContent")
  Future<GeminiResponse> sendMessage(
    @Body() GeminiRequest request,
    @Query("key") String apiKey,
  );
}
