import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_setup/features/authentication/view_models/signup_view_model.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../utils.dart';
import '../widgets/mood_button_widgets.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static String routeName = "signUp";
  static String routeURL = "/signUp";

  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onCreateAccountTap() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    ref.read(signUpViewModel.notifier).signUp(context, email, password);
  }

  void _onLoginInTap() {
    context.pop();
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
                "Join!",
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
                  buttonText: "Create Account",
                  onTap: _onCreateAccountTap,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 300,
                height: 48,
                child: MoodButtonWidget(
                  buttonText: "Log in >",
                  onTap: _onLoginInTap,
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
