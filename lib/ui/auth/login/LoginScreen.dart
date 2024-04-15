import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbot/core/utiltis/dialog_utiltis.dart';
import 'package:medbot/core/utiltis/firebase_error_codes.dart';
import 'package:medbot/core/utiltis/my_vaildation.dart';
import 'package:medbot/ui/HomeScreen/homeScreen.dart';
import 'package:medbot/ui/auth/register.dart';
import 'package:medbot/ui/componant/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordContrller = TextEditingController();

  TextEditingController PasswrodConfirmationContrller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    controller: EmailController,
                    validation: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "enter valid email";
                      }
                      if (!MyValidations.isValidEmail(text)) {
                        return "enter invlaild email";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                  CustomTextFormField(
                    controller: PasswordContrller,
                    validation: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "enter valid password";
                      }
                      if (text.length < 6) {
                        return "enter invalid password";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        LoginScreen();
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: Text("Dont have account"))
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> LoginScreen() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      DialogUtils.showLoadingDialog(context: context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text.trim(), password: PasswordContrller.text);

      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
          context: context,
          message: "User signed in successfully${credential.user?.uid}",
          postiveTitle: "ok",
          postiveClick: () {
            DialogUtils.hideDialog(context);
             Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          });
      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthErrorCodes.userNotFound) {
        DialogUtils.showMessageDialog(
            context: context,
            message: "No user found for that email",
            postiveTitle: "ok",
            postiveClick: () {
              DialogUtils.hideDialog(context);
            });
      } else if (e.code == FirebaseAuthErrorCodes.worngPass) {
        print('Wrong password provided for that user.');
      }
    }
  }
}
