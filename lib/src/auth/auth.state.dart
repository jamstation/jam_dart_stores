import 'package:jam_dart_models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState {
  final User user;
  final bool loading;
  final bool isInitialized;

  bool get isAuthenticated => (user != null);

  const AuthState({
    @required this.user,
    @required this.loading,
    @required this.isInitialized,
  });

  AuthState.initialize()
      : user = null,
        loading = false,
        isInitialized = false;

  AuthState copyWith({
    User user,
    bool loading,
    bool isInitialized,
  }) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          this.user == other.user &&
          this.loading == other.loading &&
          this.isInitialized == other.isInitialized;

  @override
  int get hashCode =>
      this.user.hashCode ^ this.loading.hashCode ^ this.isInitialized.hashCode;
}
