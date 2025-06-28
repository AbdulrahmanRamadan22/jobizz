import 'package:json_annotation/json_annotation.dart';
part 'delete_response_model.g.dart';

@JsonSerializable()
class DeleteAccountResponse {
  final String? message;
  final String? status;

  DeleteAccountResponse({
    this.message,
    this.status,
  });
  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
}
