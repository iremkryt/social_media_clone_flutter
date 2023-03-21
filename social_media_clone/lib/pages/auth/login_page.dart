import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    kullaniciTextFile(),
                    passwordTextFile(),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {}, 
                        child: const Text("Şifremi Unuttum", 
                          style: TextStyle(color: Color.fromARGB(255, 137, 54, 54)),
                        ),
                      ),
                    ),
                    //customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
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
                    ),
                   // customSizedBox(),
                    signUpButton(),
                  ], 
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

    TextFormField kullaniciTextFile(){
    return TextFormField(
      decoration: customInputDecoration("Kullanıcı Adı"),
    );
  }

  TextFormField passwordTextFile(){
    return TextFormField(
      obscureText: true,
      decoration: customInputDecoration("Şifre"),
    );
  }
}