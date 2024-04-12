import 'package:flutter/material.dart';
import 'package:medbot/core/utiltis/my_vaildation.dart';
import 'package:medbot/ui/HomeScreen/homeScreen.dart';
import 'package:medbot/ui/auth/login/LoginScreen.dart';
import 'package:medbot/ui/componant/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName='Register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController=TextEditingController();

  TextEditingController EmailController=TextEditingController();

  TextEditingController PasswordContrller=TextEditingController();

  TextEditingController PasswrodConfirmationContrller=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/images/background.png")
          ,fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey ,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    controller: fullNameController,
                    validation:(text) {
                      if(text==null||text.trim().isEmpty){
                        return"enter valid name";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Full Name",
                    ),

                  ),
                  CustomTextFormField(
                    controller: EmailController,
                    validation:(text) {
                      if(text==null||text.trim().isEmpty){
                        return"enter valid email";
                      }
                      if(!MyValidations.isValidEmail(text)){
                        return "enter invlaild email";
                      }
                    },

                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),

                  ),
                  CustomTextFormField (
                    controller: PasswordContrller,
                    validation:(text) {
                      if(text==null||text.trim().isEmpty){
                        return"enter valid password";
                      }
                      if(text.length<6){
                        return "enter invalid password";
                      }

                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),

                  ),
                  CustomTextFormField(
                    controller: PasswrodConfirmationContrller,
                    validation:(text) {
                      if(text==null||text.trim().isEmpty){
                        return"enter valid email";
                      }
                      if(PasswordContrller.text != text){
                        return "password doesn't match";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                    ),
                  ),
                  SizedBox(

                    height: 25,

                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue ,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      onPressed: (){
                        register();

                  }, child: Text("Create Account",style: TextStyle(fontSize:24 ),)),
                  TextButton(onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  }, child: Text("Already have Account"))

                ],
              ),
            ),
          ),
        ));
  }

  void register() {
    if(formKey.currentState?.validate()==false){
      return;
    }
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
