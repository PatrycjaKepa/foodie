import 'package:flutter/material.dart';

class PasswordValidator extends StatefulWidget {

  @override
  State<PasswordValidator> createState() => _PasswordValidatorState();
}

  class _PasswordValidatorState extends State<PasswordValidator> { 

    bool _isValid = false; 
  String _errorMessage = ''; 

  TextEditingController _passwordController = TextEditingController(); 
  
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Column(
        children: [
          _isValid 
                ? Text( 
                    'Password is valid!', 
                    style: TextStyle(color: Colors.green), 
                  ) 
                : Text( 
                    'Password is not valid!\n'
                    '• $_errorMessage', 
                    style: TextStyle(color: Colors.red), 
                  ), 
        ],),
        );
  }

  bool _validatePassword(String password) { 
    // Reset error message 
    _errorMessage = ''; 
  
    // Password length greater than 6 
    if (password.length <6) { 
      _errorMessage += 'Password must be longer than 6 characters.\n'; 
    } 
  
    // Contains at least one uppercase letter 
    if (!password.contains(RegExp(r'[A-Z]'))) { 
      _errorMessage += '• Uppercase letter is missing.\n'; 
    } 
  
    // Contains at least one lowercase letter 
    if (!password.contains(RegExp(r'[a-z]'))) { 
      _errorMessage += '• Lowercase letter is missing.\n'; 
    } 
  
    // Contains at least one digit 
    if (!password.contains(RegExp(r'[0-9]'))) { 
      _errorMessage += '• Digit is missing.\n'; 
    } 
  
    // Contains at least one special character 
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) { 
      _errorMessage += '• Special character is missing.\n'; 
    } 
  
    // If there are no error messages, the password is valid 
    return _errorMessage.isEmpty; 
  }}
            