
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signUpWithEmailRegisterUser(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('this pass is too week');
    } else if (e.code == 'email is alredy in our system') {
      print('this email is alredy have account ');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> logInWithEmailUser(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

  } on FirebaseAuthException catch (e) {
    if (e.code == 'no user') {
      print('no user for that email');
    } else if (e.code == 'error password worng') {
      print('enterd Wrong password');
    }
  } catch (e) {
    print(e);
  }
}
