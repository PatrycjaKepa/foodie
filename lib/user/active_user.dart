import 'dart:convert';

class ActiveUser {
  String email;
  String password;

  ActiveUser({required this.email, required this.password});

  String getAuthenticationKey() {
    String password = this.password;
    String email = this.email;
    return 'Basic ${base64Encode(utf8.encode('$email + :$password'))}';
  }

  void setAuthenticationData(String email, String password) {
    if (this.email.isNotEmpty || this.password.isNotEmpty) {
      throw Exception('User is logged in');
    }
    this.email = email;
    this.password = password;
  }
  
  void removeAuthenticationData() {
    email = '';
    password = '';
  }

}