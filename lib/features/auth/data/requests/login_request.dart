import 'package:flutter_auth_clean/core/network/api_request.dart';

class LoginRequest implements ApiRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  String get path => '/auth/login';

  @override
  String get method => 'POST';

  @override
  Map<String, dynamic> get data => {
        'email': email,
        'password': password,
      };

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  Map<String, dynamic>? get headers => null;
}
