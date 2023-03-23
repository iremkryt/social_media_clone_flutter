import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      print("Anon error $e");
      return null;
    }
  }

  Future forgotPassword(String email) async {
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      print("Mail kutunuzu kontrol ediniz");
    } catch (e) {
      
    }
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      res = "Succes";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanıcı Bulunamadı!";

      } else if(e.code == "wrong-password") {
        res = "Şifre Yanlış!";
      } else if(e.code == "user-disabled") {
        res = "Kullanıcı Bloke Olmuştur!";
      }
    }
    return res;
  }
}