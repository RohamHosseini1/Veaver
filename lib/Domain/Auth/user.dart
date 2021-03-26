import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
  }) = _User;

  // final int id;
  // final String username;
  // final String teamname;
  // User(required this.od, required this.username, required this.teamname)
}
