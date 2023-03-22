import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                      forgotPasswordButton(),
                      //customSizedBox(),
                      signInButton(),
                     // customSizedBox(),
                      signUpButton(),
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
        onPressed: () => Navigator.pushNamed(context, "/signUp"), 
        child: Text(
          "Hesap oluştur",
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

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 164, 211, 216),
          ),
          child: const Center(
            child: Text("Giriş Yap", 
              style: TextStyle(color: Color.fromARGB(255, 37, 39, 55)),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          try {
            final userResult = await firebaseAuth.signInWithEmailAndPassword(
              email: email, 
              password: password
            );
            Navigator.pushReplacementNamed(context,"/homePage");
            print(userResult.user!.email);
          } catch (e) {
            print(e.toString());
          }
        } else {
          
        }
      }

  Center forgotPasswordButton(){
    return Center(
      child: TextButton(
        onPressed: () {}, 
        child: const Text("Şifremi Unuttum", 
          style: TextStyle(color: Color.fromARGB(255, 137, 54, 54)),
        ),
      ),
    );
  }
}