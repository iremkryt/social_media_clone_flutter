import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

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
      res = "Success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          res = "Kullanıcı Bulunamadı!";
          break;
        case "wrong-password":
          res = "Şifre Yanlış!";
          break;
        case "user-disabled":
          res = "Kullanıcı Bloke Olmuştur!";
          break;
        default:
          res = "Bir hata ile karşılaşıldı. Birazdan tekrar deneyiniz.";
          break;
      }
    }
    return res;
  }

  Future<String?> signUp(
    String email, 
    String username,
    String fullname,
    String password
  ) async {
    String? res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        try {
          final resultData = await firebaseFirestore.collection("Users").add({
            "email" : email,
            "fullname" : fullname,
            "username" : username,
            "post" : [],
            "followers" : [],
            "following" : [],
            "bio" : "",
            "website" : ""
          });
        } catch (e) {
          print("$e");
        }
        res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "Mail zaten kayıtlı!";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçersiz mail!";
          break;
        default:
          res = "Bir hata ile karşılaşıldı. Birazdan tekrar deneyiniz.";
          break;
      }
    }
  }
}