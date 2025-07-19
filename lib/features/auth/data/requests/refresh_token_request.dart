import 'package:flutter_auth_clean/core/network/api_request.dart';

class RefreshTokenRequest implements ApiRequest {
  final String refreshToken;
  RefreshTokenRequest(this.refreshToken);

  @override
  String get path => '/auth/refresh';

  @override
  String get method => 'POST';

  @override
  Map<String, dynamic> get data => {
        'refresh_token': refreshToken,
      };

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  Map<String, dynamic>? get headers => null;
}
