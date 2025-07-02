import 'package:json_annotation/json_annotation.dart';

part 'chat_support_request.g.dart';
@JsonSerializable()
class ChatSupportRequest {
  final String? message;

  ChatSupportRequest({
    this.message,
  });

  Map<String, dynamic> toJson() => _$ChatSupportRequestToJson(this);
}
