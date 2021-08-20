class LoginResponse {
  final String accessToken;
  final int expiresIn;
  final String tokenType;
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      refreshToken: json['refresh_token'],
    );
  }

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, expiresIn: $expiresIn, '
        'tokenType: $tokenType, refreshToken: $refreshToken)';
  }
}
