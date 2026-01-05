import 'package:flutter/cupertino.dart';

class AuthState extends InheritedWidget {
  final bool isAuthenticated;

  const AuthState({
    super.key,
    required this.isAuthenticated,
    required super.child,
  });

  static AuthState of(BuildContext context) {
    final AuthState? result =
    context.dependOnInheritedWidgetOfExactType<AuthState>();
    assert(result != null, 'No AuthState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AuthState oldWidget) =>
      isAuthenticated != oldWidget.isAuthenticated;
}
