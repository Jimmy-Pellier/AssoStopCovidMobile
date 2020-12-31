import 'dart:io';

class CrsfToken {
  final String token;
  Cookie session;
  CrsfToken({this.token, this.session});

  Cookie getSessionCookie() {
    return session;
  }

  setSessionCookie(Cookie _session) {
    session = _session;
  }

  factory CrsfToken.fromJson(Map<String, dynamic> json) {
    return CrsfToken(
      token: json['crsf'],
    );
  }
}
