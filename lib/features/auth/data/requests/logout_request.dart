import 'package:flutter_auth_clean/core/network/api_request.dart';

class LogoutRequest implements ApiRequest {
  @override
  String get path => '/auth/logout';

  @override
  String get method => 'POST';

  @override
  Map<String, dynamic>? get data => null;

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  Map<String, dynamic>? get headers => null;
}
