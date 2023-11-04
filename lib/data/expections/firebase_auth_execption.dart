enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  invalidCredential,
  accountExistsWithDifferentCredential,
  weakPassword,
  userNotVerified
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "INVALID_LOGIN_CREDENTIALS":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "invalid-credential":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "account-exists-with-different-credential":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "weak-password":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "user-not-verified":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      case AuthResultStatus.invalidCredential:
        errorMessage = "The provided credential is not valid.";
        break;
      case AuthResultStatus.accountExistsWithDifferentCredential:
        errorMessage =
        "An account already exists with the same email address but different sign-in provider.";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "The provided password is too weak.";
        break;
      case AuthResultStatus.userNotVerified:
        errorMessage = "The user's email address has not been verified.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
