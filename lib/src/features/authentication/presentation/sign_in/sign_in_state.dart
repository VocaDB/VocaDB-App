// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vocadb_app/src/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:vocadb_app/src/localization/string_hardcoded.dart';

/// Mixin class to be used for client-side username & password validation
mixin UsernameAndPasswordValidators {
  final StringValidator usernameSubmitValidator = NonEmptyStringValidator();
  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();
}

/// State class for the username & password form.
class SignInState with UsernameAndPasswordValidators {
  SignInState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  SignInState copyWith({
    AsyncValue<void>? value,
  }) {
    return SignInState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'SignInState(value: $value)';

  @override
  bool operator ==(covariant SignInState other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

extension UsernamePasswordSignInStateX on SignInState {
  String get passwordLabelText {
    return 'Password'.hardcoded;
  }

  // Getters
  String get primaryButtonText {
    return 'Sign in'.hardcoded;
  }

  String get errorAlertTitle {
    return 'Sign in failed'.hardcoded;
  }

  String get title {
    return 'Sign in'.hardcoded;
  }

  bool canSubmitUsername(String username) {
    return usernameSubmitValidator.isValid(username);
  }

  bool canSubmitPassword(String password) {
    return passwordSignInSubmitValidator.isValid(password);
  }

  String? ussernameErrorText(String username) {
    final bool showErrorText = !canSubmitUsername(username);
    return showErrorText ? 'Username can\'t be empty'.hardcoded : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    return showErrorText ? 'Password can\'t be empty'.hardcoded : null;
  }
}
