import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class GeminiResponsePart {
  final String? text;
  GeminiResponsePart({ this.text});

  factory GeminiResponsePart.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponsePartFromJson(json);
  Map<String, dynamic> toJson() => _$GeminiResponsePartToJson(this);
}

@JsonSerializable()
class GeminiResponseContent {
  final List<GeminiResponsePart?> ?parts;
  GeminiResponseContent({ this.parts});

  factory GeminiResponseContent.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseContentFromJson(json);
  Map<String, dynamic> toJson() => _$GeminiResponseContentToJson(this);
}

@JsonSerializable()
class GeminiCandidate {
  final GeminiResponseContent ?content;
  GeminiCandidate({ this.content});

  factory GeminiCandidate.fromJson(Map<String, dynamic> json) =>
      _$GeminiCandidateFromJson(json);
  Map<String, dynamic> toJson() => _$GeminiCandidateToJson(this);
}

@JsonSerializable()
class GeminiResponse {
  final List<GeminiCandidate?>? candidates;
  GeminiResponse({required this.candidates});

  factory GeminiResponse.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GeminiResponseToJson(this);
}
