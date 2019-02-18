import 'package:jam_dart_stores/src/_for_epic.index.dart';
import 'auth.actions.dart';

class AuthMiddleware<State> {
  final DatabaseInterface _db;
  final AuthInterface _authService;
  final Table userTable;

  const AuthMiddleware(this._db, this._authService, this.userTable);

  Epic<State> get epics => combineEpics<State>([
        TypedEpic(_initializeEpic),
        TypedEpic(_registerEpic),
        TypedEpic(_signInEpic),
        TypedEpic(_signInWithGoogleEpic),
        TypedEpic(_signOutEpic),
      ]);

  Stream<dynamic> _initializeEpic(
    Stream<InitializeAuthAction> action,
    EpicStore<State> store,
  ) {
    return Observable(action)
        .switchMap((action) => _authService.user)
        .switchMap((user) => user == null
            ? Observable.just(null)
            : _db.forceGet(userTable,
                item: user, searchColumn: 'uid', searchKey: user.uid))
        .map((user) => user == null
            ? DeauthenticateSuccessAction()
            : AuthenticateSuccessAction(user));
  }

  Stream<RegisterSuccessAction> _registerEpic(
    Stream<RegisterAction> action,
    EpicStore<State> store,
  ) {
    return Observable(action)
        .switchMap((action) => _authService.register(action.credential))
        .map((user) => RegisterSuccessAction());
  }

  Stream<SignInSuccessAction> _signInEpic(
    Stream<SignInAction> action,
    EpicStore<State> store,
  ) {
    return Observable(action)
        .switchMap((action) => _authService.signIn(action.credential))
        .map((user) => SignInSuccessAction());
  }

  Stream<SignInSuccessAction> _signInWithGoogleEpic(
    Stream<SignInWithGoogleAction> action,
    EpicStore<State> store,
  ) {
    return Observable(action)
        .switchMap((action) => _authService.signInWithGoogle())
        .map((user) => SignInSuccessAction());
  }

  Stream<SignOutSuccessAction> _signOutEpic(
    Stream<SignOutAction> action,
    EpicStore<State> store,
  ) {
    return Observable(action)
        .switchMap((action) => _authService.signOut())
        .map((_) => SignOutSuccessAction());
  }
}
