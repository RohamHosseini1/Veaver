import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_world/domain/auth/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated({
    required User user,
  }) = _Authenticated;
}

// //fuck you stupid ass code