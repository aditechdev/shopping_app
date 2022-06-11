import 'package:flutter/material.dart';
import 'package:shopping_app/common/widget/custom_button.dart';
import 'package:shopping_app/common/widget/custom_form_text_field.dart';
import 'package:shopping_app/constants/global_variable.dart';

enum Auth { register, signIn }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.register;
  final _signUpGlobalKey = GlobalKey<FormState>();
  final _signInGlobalKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: (_auth == Auth.register)
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundColor,
              title: const Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.register,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            (_auth == Auth.register)
                ? Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      child: Column(
                        children: [
                          CustomFormTextField(
                            controller: nameTextController,
                            label: "Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            controller: emailTextController,
                            label: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            controller: passwordTextController,
                            label: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(buttonText: "Sign Up", onTap: () {})
                        ],
                      ),
                      key: _signUpGlobalKey,
                    ),
                  )
                : Container(),
            ListTile(
              tileColor: (_auth == Auth.signIn)
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundColor,
              title: const Text(
                "Sign-In.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.signIn,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(
                    () {
                      _auth = value!;
                    },
                  );
                },
              ),
            ),
            (_auth == Auth.signIn)
                ? Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            controller: emailTextController,
                            label: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            controller: passwordTextController,
                            label: "Password",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(buttonText: "Sign-In", onTap: () {})
                        ],
                      ),
                      key: _signInGlobalKey,
                    ),
                  )
                : Container(),
          ],
        ),
      )),
    );
  }
}
