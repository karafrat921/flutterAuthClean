abstract class ApiRequest {
  String get path;
  String get method; // 'GET', 'POST', vs.
  Map<String, dynamic>? get data => null;
  Map<String, dynamic>? get queryParameters => null;
  Map<String, dynamic>? get headers => null;
}
