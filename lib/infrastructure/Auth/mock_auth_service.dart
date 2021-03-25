import 'package:hooks_riverpod/hooks_riverpod.dart';

class MockAuthService {
  Future<Map<String, dynamic>> login() async {
    await Future.delayed(Duration(seconds: 3));
    return {
      'userid': 0001,
      'username': 'Roham',
      'teamname': 'Rohamhosseini.com',
    };
  }

  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}

final mockAuthServiceProvider = Provider((_) => MockAuthService());
