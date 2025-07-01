import 'package:dio/dio.dart';
import 'package:jobizz/features/settings/data/model/chat_support_request.dart';
import 'package:jobizz/features/settings/data/model/chat_support_respones.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'chat_suport_api.g.dart';
@RestApi(baseUrl: "https://aijobizz-production.up.railway.app")
abstract class ChatApi {
  factory ChatApi(Dio dio, {String baseUrl}) = _ChatApi;

  @POST("/api/chat/")
  Future<ChatSupportRespones> sendMessage(
    @Body() ChatSupportRequest request,
  );
}
