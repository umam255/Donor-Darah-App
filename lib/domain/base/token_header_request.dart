class TokenHeaderRequest {
  Future<String> token;
  TokenHeaderRequest({
    required this.token,
  });

  Map<String, Future<String>> toHeader() {
    return <String, Future<String>>{
      'Authentication': token,
    };
  }
}
