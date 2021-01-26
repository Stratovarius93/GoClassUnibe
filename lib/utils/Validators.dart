String validatorPassword(String password) {
  if (password.length > 0 && password.length <= 5) {
    return 'Debe ser minimo 6 caracteres';
  } else {
    return null;
  }
}

String validatorEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String _validator;
  RegExp regExp = RegExp(pattern);
  if (email == '') {
    _validator = null;
  } else {
    if (regExp.hasMatch(email)) {
      if (email.length > 1) {
        _validator = null;
      }
    } else {
      _validator = 'Correo no válido';
    }
  }
  return _validator;
}
