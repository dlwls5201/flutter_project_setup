import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_setup/features/authentication/signup_screen.dart';
import 'package:project_setup/features/widgets/mood_button_widgets.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../utils.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";
  static String routeURL = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onEnterTap() {}

  void _onCreateAccountTap() {
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Gaps.v48,
              const Text(
                "🔥MOOD🔥",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v80,
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v32,
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isDarkMode(context) ? Colors.grey : Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size16,
                  ),
                ),
                child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )),
              ),
              Gaps.v12,
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isDarkMode(context) ? Colors.grey : Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size16,
                  ),
                ),
                child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )),
              ),
              Gaps.v24,
              SizedBox(
                width: 300,
                height: 48,
                child: MoodButtonWidget(
                  buttonText: "Enter",
                  onTap: _onEnterTap,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 300,
                height: 48,
                child: MoodButtonWidget(
                  buttonText: "Create an Account >",
                  onTap: _onCreateAccountTap,
                ),
              ),
              Gaps.v36,
            ],
          ),
        ),
      ),
    );
  }
}
