class Validators {
  String? validateName(String? name) {
    RegExp regExp =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

    if (name?.length == 0) {
      return 'Full Name is required!';
    }

    if (!regExp.hasMatch(name!)) {
      return "Invalid input";
    }

    return null;
  }

  String? validateEmail(String? email) {
    if (email?.length == 0) {
      return 'Email is required!';
    }

    RegExp regExp =
        RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');

    if (!regExp.hasMatch(email!)) {
      return 'Invalid email!';
    }

    // just for testing
    if (email == 'existing@test.com') {
      return 'Email already exists!';
    }

    return null;
  }

  String? validatePassword(String? password) {
    RegExp regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');

    if (password?.length == 0) {
      return 'Password is required!';
    }

    if (!regExp.hasMatch(password!)) {
      return 'Password must be at least 8 characters and contain a number, a  special character, a capital and a small letter.';
    }
  }

  String? validateOTP(String? otpCode) {
    RegExp regExp = RegExp(r'^[0-9]{6}$');

    if (otpCode?.length == 0) {
      return 'OTP can\'t be empty';
    }

    if (!regExp.hasMatch(otpCode!)) {
      return 'OTP code must be exactly 6 characters and only contain numbers.';
    }
  }

  String? validatePhone(String? phone) {
    RegExp regExp = RegExp(r'[0-9]{10}');
    // ignore: prefer_is_empty
    if (phone?.length == 0) {
      return 'Phone is required';
    }

    if (!regExp.hasMatch(phone!)) {
      return 'Phone Number must be exactly 6 characters and only contain numbers';
    }
  }
}
