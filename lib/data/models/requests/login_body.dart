class LoginBody {
  final String clientId;
  final String clientSecret;
  final String grantType;
  final String username;
  final String password;

  LoginBody({
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
    required this.username,
    required this.password,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) {
    return LoginBody(
      clientId: json['client_id'],
      clientSecret: json['client_secret'],
      grantType: json['grant_type'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': grantType,
      'username': username,
      'password': password,
    };
  }
}
