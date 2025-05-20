import 'package:json_annotation/json_annotation.dart';

part 'chat_request.g.dart';

@JsonSerializable()
class GeminiRequest {
  final List<Content> contents;

  GeminiRequest({required this.contents});

  Map<String, dynamic> toJson() => {
        "contents": contents.map((e) => e.toJson()).toList(),
      };
  factory GeminiRequest.fromJson(Map<String, dynamic> json) =>
      _$GeminiRequestFromJson(json);
}

@JsonSerializable()
class Content {
  final List<Part> parts;

  Content({required this.parts});

  Map<String, dynamic> toJson() => {
        "parts": parts.map((e) => e.toJson()).toList(),
      };
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@JsonSerializable()
class Part {
  final String text;

  Part({required this.text});
  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => {"text": text};
}
