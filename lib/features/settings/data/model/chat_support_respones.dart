// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'chat_support_respones.g.dart';

@JsonSerializable()
class ChatSupportRespones {
  final String? reply;
  ChatSupportRespones({
    this.reply,
  });
  factory ChatSupportRespones.fromJson(Map<String, dynamic> json) =>
      _$ChatSupportResponesFromJson(json);
}
