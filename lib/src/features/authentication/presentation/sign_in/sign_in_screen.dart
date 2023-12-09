import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/primary_button.dart';
import 'package:vocadb_app/src/common_widgets/responsive_scrollable_card.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_state.dart';
import 'package:vocadb_app/src/localization/string_hardcoded.dart';
import 'package:vocadb_app/src/utils/async_value_ui.dart';

/// Username & password sign in screen.
/// Wraps the [SignInContents] widget below with a [Scaffold] and
/// [AppBar] with a title.
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  // * Keys for testing using find.byKey()
  static const usernameKey = Key('username');
  static const passwordKey = Key('password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const SignInContents(),
    );
  }
}

/// A widget for username & password authentication, supporting the following:
/// - sign in
/// - register (create an account)
class SignInContents extends ConsumerStatefulWidget {
  const SignInContents({
    super.key,
    this.onSignedIn,
  });
  final VoidCallback? onSignedIn;

  @override
  ConsumerState<SignInContents> createState() => _SignInContentsState();
}

class _SignInContentsState extends ConsumerState<SignInContents> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String get username => _usernameController.text;
  String get password => _passwordController.text;

  // local variable used to apply AutovalidateMode.onUserInteraction and show
  // error hints only when the form has been submitted
  var _submitted = false;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(SignInState state) async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(signInControllerProvider.notifier);
      final success = await controller.submit(username, password);
      if (success) {
        widget.onSignedIn?.call();
      }
    }
  }

  void _usernameEditingComplete(SignInState state) {
    if (state.canSubmitUsername(username)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete(SignInState state) {
    if (!state.canSubmitPassword(password)) {
      _node.previousFocus();
      return;
    }
    _submit(state);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      signInControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(signInControllerProvider);
    return ResponsiveScrollableCard(
      child: FocusScope(
        node: _node,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              gapH8,
              // Username field
              TextFormField(
                key: SignInScreen.usernameKey,
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username'.hardcoded,
                  enabled: !state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (username) => !_submitted
                    ? null
                    : state.ussernameErrorText(username ?? ''),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _usernameEditingComplete(state),
              ),
              gapH8,
              // Password field
              TextFormField(
                key: SignInScreen.passwordKey,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: state.passwordLabelText,
                  enabled: !state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => !_submitted
                    ? null
                    : state.passwordErrorText(password ?? ''),
                obscureText: true,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _passwordEditingComplete(state),
              ),
              gapH8,
              PrimaryButton(
                text: state.primaryButtonText,
                isLoading: state.isLoading,
                onPressed: state.isLoading ? null : () => _submit(state),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
