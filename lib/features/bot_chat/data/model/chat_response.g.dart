// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiResponsePart _$GeminiResponsePartFromJson(Map<String, dynamic> json) =>
    GeminiResponsePart(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$GeminiResponsePartToJson(GeminiResponsePart instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

GeminiResponseContent _$GeminiResponseContentFromJson(
        Map<String, dynamic> json) =>
    GeminiResponseContent(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GeminiResponsePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeminiResponseContentToJson(
        GeminiResponseContent instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };

GeminiCandidate _$GeminiCandidateFromJson(Map<String, dynamic> json) =>
    GeminiCandidate(
      content: json['content'] == null
          ? null
          : GeminiResponseContent.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiCandidateToJson(GeminiCandidate instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

GeminiResponse _$GeminiResponseFromJson(Map<String, dynamic> json) =>
    GeminiResponse(
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GeminiCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeminiResponseToJson(GeminiResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
