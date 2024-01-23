import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';

import '../../../config/routes/route_names.dart';
import '../../../core/models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: context.dynamicHeight(0.01),
            right: context.dynamicWidth(0.05),
            left: context.dynamicWidth(0.05),
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SIGN UP",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: context.dynamicHeight(0.05),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) => value!.isEmpty ? "E Harfi girme" : null,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: "Username",
                  ),
                ),
                Padding(
                  padding: context.paddingVerticalDefault,
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your password" : null,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                          // print(_isObscure);
                        },
                        icon: Icon(_isObscure ? Icons.lock : Icons.lock_open),
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have an account? "),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteNames.signIn),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
                // TextButton(
                //   onPressed: () {
                //     print("Tıklandı!");
                //   },
                //   child: const Text(
                //     "Register Here",
                //     style: TextStyle(
                //       color: Colors.purple,
                //     ),
                //   ),
                // ), Ek bir kullanım olarak kullanılabilir

                Padding(
                  padding: context.paddingTopLow,
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final userName = _usernameController.text;
                        final password = _passwordController.text;

                        UserModel userModel =
                            UserModel(userName: userName, password: password);
                        Navigator.pushNamed(
                          context,
                          RouteNames.home,
                          arguments: {
                            "userModel": userModel,
                          },
                        );
                      } else {
                        debugPrint("Edilmedi");
                      }
                    },
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.1),
                        vertical: context.dynamicHeight(0.02),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
