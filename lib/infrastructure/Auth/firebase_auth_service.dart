import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);
