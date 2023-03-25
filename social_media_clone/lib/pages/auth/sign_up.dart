import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:social_media_clone/pages/home_page.dart';
import 'package:social_media_clone/service/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String email, fullname, username, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/header.png"),
                  ),
                ),
              ),
              customSizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Merhaba, \nHoşgeldin",
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 37, 39, 55),
                        ),
                      ),
                      customSizedBox(),
                      emailTextFile(),
                      fullnameTextFile(),
                      usernameTextFile(),
                      passwordTextFile(),
                      customSizedBox(),
                      signUpButton(),
                      backToLoginPage(),
                    ], 
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => const SizedBox(
    height: 25,
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
                    hintText: hintText,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 37, 39, 55),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 37, 39, 55),
                      ),
                    ),
                  );
  }

  Center signUpButton(){
    return Center(
      child: TextButton(
        onPressed: signUp, 
        child: Text(
          "Hesap oluştur",
          style: TextStyle(color: Color.fromARGB(255, 37, 39, 55))
        ),
      ),
    );
  }

  void signUp() async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          final result =
            await authService.signUp(email, username, fullname, password);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => HomePage())), 
            (route) => false
          );
        } else {
  
        }
      }
  Center backToLoginPage(){
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/loginPage"), 
        child: Text(
          "Giriş sayfasına geri dön",
          style: TextStyle(color: Color.fromARGB(255, 37, 39, 55))
        ),
      ),
    );
  }

  TextFormField emailTextFile(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty){
          return "Bilgileri eksiksiz doldurunuz..";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: customInputDecoration("E-mail"),
    );
  }

  TextFormField fullnameTextFile(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty){
          return "Bilgileri eksiksiz doldurunuz..";
        } else {}
      },
      onSaved: (value) {
        fullname = value!;
      },
      decoration: customInputDecoration("Ad Soyad"),
    );
  }

  TextFormField usernameTextFile(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty){
          return "Bilgileri eksiksiz doldurunuz..";
        } else {}
      },
      onSaved: (value) {
        username = value!;
      },
      decoration: customInputDecoration("Kullanıcı Adı"),
    );
  }

  TextFormField passwordTextFile(){
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty){
          return "Bilgileri eksiksiz doldurunuz..";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      decoration: customInputDecoration("Şifre"),
    );
  }
}