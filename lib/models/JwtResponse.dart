import 'package:jwt_decoder/jwt_decoder.dart';

class JwtResponse {
  final String token;
  final String refreshToken;

  JwtResponse({this.token, this.refreshToken});

  factory JwtResponse.fromJson(Map<String, dynamic> json) {
    return JwtResponse(token: json['access_token'], refreshToken: json['refresh_token']);
  }

  String getTokenGuid() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken["sub"];
  }
}
