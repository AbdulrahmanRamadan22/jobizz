import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_request.g.dart';

@JsonSerializable()
class ForgetPassRequest {
  String email;
  ForgetPassRequest({
    required this.email,
  });
  Map<String, dynamic> toJson() => _$ForgetPassRequestToJson(this);
}
