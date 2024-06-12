import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.freezed.dart';

@freezed
class HomeResponse<T> with _$HomeResponse {
  factory HomeResponse.success(List<T> data) = Success;
  factory HomeResponse.error(String message) = Error;
}
// dart run build_runner build
// dart run build_runner watch
