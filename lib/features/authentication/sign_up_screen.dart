import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/authentication/create_account_screen.dart';
import 'package:twitter_challenge/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onCreateScreen(BuildContext context) {
    print("click");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  void _onLoginTap(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder:(context) => LoginScreen(),)
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size28,
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    size: Sizes.size32,
                    color: Colors.blue.shade600,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size64 + Sizes.size64,
                ),
                child: Text(
                  "See what's happening in the world right now.",
                  style: TextStyle(
                    fontSize: Sizes.size30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const AuthButton(
                site: "Google",
                icon: FaIcon(
                  FontAwesomeIcons.google,
                ),
              ),
              Gaps.v14,
              const AuthButton(
                site: "Apple",
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  size: Sizes.size30,
                ),
              ),
              Gaps.v14,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    width: Sizes.size64 + Sizes.size64 + Sizes.size16,
                    height: Sizes.size2,
                  ),
                  Gaps.h14,
                  const Text("or"),
                  Gaps.h14,
                  Container(
                    color: Colors.grey.shade300,
                    width: Sizes.size64 + Sizes.size64 + Sizes.size16,
                    height: Sizes.size2,
                  ),
                ],
              ),
              Gaps.v4,
              GestureDetector(
                onTap: () => _onCreateScreen(context),
                child: const AuthButton(site: "Create account"),
              ),
              Gaps.v28,
              RichText(
                text: TextSpan(
                  text: "By signing up, you agree to our ",
                  style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                  children: [
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                      ),
                    ),
                    const TextSpan(
                      text: ", ",
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                      ),
                    ),
                    const TextSpan(
                      text: ", and ",
                    ),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                      ),
                    ),
                    const TextSpan(
                      text: ".",
                    )
                  ],
                ),
              ),
              Gaps.v52,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Have an account already?",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h4,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
