import 'package:jam_dart_models/models.dart';

class InitializeAuthAction {
  const InitializeAuthAction();
}

class AuthenticateSuccessAction {
  final User user;
  const AuthenticateSuccessAction(this.user);
}

class DeauthenticateSuccessAction {
  const DeauthenticateSuccessAction();
}

class RegisterAction {
  final Credential credential;
  const RegisterAction(this.credential);
}

class RegisterSuccessAction {
  const RegisterSuccessAction();
}

class SignInAction {
  final Credential credential;
  const SignInAction(this.credential);
}

class SignInWithGoogleAction {
  const SignInWithGoogleAction();
}

class SignInSuccessAction {
  const SignInSuccessAction();
}

class SignOutAction {
  const SignOutAction();
}

class SignOutSuccessAction {
  const SignOutSuccessAction();
}
