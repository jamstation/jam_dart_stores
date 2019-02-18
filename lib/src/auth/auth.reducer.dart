import 'auth.actions.dart';
import 'auth.state.dart';

AuthState authReducer(AuthState state, dynamic action) {
  if (action is InitializeAuthAction) {
    return state.copyWith(isInitialized: true);
  } else if (action is AuthenticateSuccessAction) {
    return state.copyWith(user: action.user);
  } else if (action is DeauthenticateSuccessAction) {
    return AuthState.initialize();
  } else if (action is SignInWithGoogleAction) {
    return state.copyWith(loading: true);
  } else if (action is SignInSuccessAction) {
    return state.copyWith(loading: false);
  } else if (action is SignOutAction) {
    return state.copyWith(loading: true);
  } else if (action is SignOutSuccessAction) {
    return state.copyWith(loading: false);
  } else {
    return state;
  }
}
