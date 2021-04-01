import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hello_world/application/auth/auth_bloc.dart';
import 'package:hello_world/application/auth/login_bloc.dart';
import 'package:yeet/yeet.dart';
import 'package:hello_world/common/veaver_colors.dart';
import 'package:hello_world/home_view.dart';

class AuthView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authBlocProvider.state);
    final loginState = useProvider(loginBlocProvider.state);
    final loginBloc = useProvider(loginBlocProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
            ),
            authState.when(
              loading: () => Center(child: CircularProgressIndicator()),
              authenticated: (user) {
                Future.delayed(Duration(milliseconds: 300)).then((_) {
                  context.yeet('/home_view');
                });
                return Center(child: Text('Welcome ${user.id}'));
              },
              unauthenticated: () => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: (value) {
                          loginBloc.emailChanged(value);
                        },
                        decoration: InputDecoration(
                          errorText: loginState.emailError,
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          loginBloc.passwordChanged(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          loginBloc.loginPressed();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (_) => VeaverColors.mainColor,
                          ),
                        ),
                        child: Text('Sign in'),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          loginBloc.registerPressed();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (_) => VeaverColors.mainColor,
                          ),
                        ),
                        child: Text('Register'),
                      ),
                      SizedBox(height: 24),
                      TextButton(
                          onPressed: () {
                            context.yeet('/reset-pass');
                          },
                          child: Text('Forgot password?'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
