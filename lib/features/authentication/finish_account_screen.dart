import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/authentication/confirmation_code_screen.dart';

class FinishAccountScreen extends StatelessWidget {
  const FinishAccountScreen({
    super.key,
    required this.formData,
  });

  final formData;
  // late final StateMachineController _stateMachineController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size32,
          color: Colors.blue.shade600,
        ),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(
            letterSpacing: -0.4,
            wordSpacing: 0,
            fontSize: 15,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size16,
              bottom: Sizes.size10,
              left: Sizes.size32,
              right: Sizes.size32,
            ),
            child: Column(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create your account",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.2,
                        ),
                      ),
                      Gaps.v10,
                      TextFormField(
                        readOnly: true,
                        initialValue: formData['name'],
                        style: TextStyle(
                          color: Colors.blue.shade400,
                          fontSize: Sizes.size18,
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "8 to 12 characters",
                          hintStyle: const TextStyle(
                            fontSize: Sizes.size14,
                          ),
                          floatingLabelStyle: TextStyle(
                            height: -0.0001,
                            fontSize: Sizes.size20,
                            color:
                                Theme.of(context).appBarTheme.foregroundColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          suffixIcon: const FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          ),
                          suffixIconConstraints: BoxConstraints.tight(
                            const Size(30, 1),
                          ),
                        ),
                        cursorColor: Colors.blue.shade400,
                        cursorHeight: Sizes.size24,
                      ),
                      Gaps.v10,
                      TextFormField(
                        readOnly: true,
                        initialValue: formData['account'],
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.blue.shade400,
                          fontSize: Sizes.size18,
                        ),
                        decoration: InputDecoration(
                          labelText: "Phone number or email address",
                          hintText: "example@email.come or 01012345678",
                          hintStyle: const TextStyle(
                            fontSize: Sizes.size14,
                          ),
                          floatingLabelStyle: TextStyle(
                            height: -0.0001,
                            fontSize: Sizes.size20,
                            color:
                                Theme.of(context).appBarTheme.foregroundColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          suffixIcon: const FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          ),
                          suffixIconConstraints: BoxConstraints.tight(
                            const Size(30, 1),
                          ),
                        ),
                        cursorColor: Colors.blue.shade400,
                        cursorHeight: Sizes.size24,
                      ),
                      Gaps.v20,
                      TextFormField(
                        readOnly: true,
                        initialValue: formData['date'],
                        keyboardType: TextInputType.none,
                        style: TextStyle(
                          color: Colors.blue.shade400,
                          fontSize: Sizes.size18,
                        ),
                        decoration: InputDecoration(
                          labelText: "Date of birth",
                          floatingLabelStyle: const TextStyle(
                            height: -0.0001,
                            fontSize: Sizes.size20,
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          suffixIcon: const FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          ),
                          suffixIconConstraints: BoxConstraints.tight(
                            const Size(30, 1),
                          ),
                        ),
                        cursorColor: Colors.blue.shade400,
                        cursorHeight: Sizes.size24,
                      ),
                    ],
                  ),
                ),
                Gaps.v64,
                Gaps.v64,
                Gaps.v32,
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    text: "By signing up, you agree to the ",
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                      const TextSpan(
                        text: " and ",
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                      const TextSpan(
                        text: ", including ",
                      ),
                      TextSpan(
                        text: "Cookie Use",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
                      ),
                      TextSpan(
                        text: "Learn more",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
                      ),
                      TextSpan(
                        text: "here",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v18,
                const OriginSignUpButton(),
                // Container(
                //   height: Sizes.size60,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.grey.shade400,
                //       width: Sizes.size1,
                //     ),
                //     borderRadius: BorderRadius.circular(
                //       Sizes.size48,
                //     ),
                //   ),
                //   clipBehavior: Clip.hardEdge,
                //   child: GestureDetector(
                //     onTap: onClick,
                //     child: RiveAnimation.asset(
                //       "assets/animations/sign-up-button.riv",
                //       fit: BoxFit.fitWidth,
                //       artboard: "Sign Up",
                //       stateMachines: const ["State Machine 1"],
                //       onInit: _onInit,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OriginSignUpButton extends StatelessWidget {
  const OriginSignUpButton({
    super.key,
  });

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ConfirmationCodeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onNextTap(context),
      child: Container(
        height: Sizes.size60,
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: BorderRadius.circular(
            Sizes.size48,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
