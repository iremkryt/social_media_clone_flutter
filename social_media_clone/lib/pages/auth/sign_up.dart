import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

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
                height: height * 0.42,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/waves.png"),
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
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            try {
              var userResult = 
                await firebaseAuth.createUserWithEmailAndPassword(
                  email: email, 
                  password: password
                );
              print(userResult.user!.uid);
            } catch (e) {
              print(e.toString());
            }
          } else {

          }
        }, 
        child: Text(
          "Hesap oluştur",
          style: TextStyle(color: Color.fromARGB(255, 37, 39, 55))
        ),
      ),
    );
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