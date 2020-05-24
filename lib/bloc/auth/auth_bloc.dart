import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/repositories/user_repository.dart';
import 'package:vocadb/utils/app_directory.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  final AppDirectory appDirectory;

  AuthBloc({@required this.userRepository, @required this.appDirectory})
      : assert(userRepository != null),
        assert(appDirectory != null);

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthInit || event is LoggedIn) {
      UserModel userModel;
      try {
        userModel = await userRepository.getCurrent();
      } catch (_) {
        yield AuthError();
      }

      if (userModel != null) {
        yield AuthAuthenticated(user: userModel);
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedOut) {
      appDirectory.clearCookies();
      yield AuthUnauthenticated();
    }
  }
}
