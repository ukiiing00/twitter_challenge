import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/authentication/finish_account_screen.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({
    super.key,
    required this.formData,
  });

  final Map<String, String> formData;

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  void _goLastPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FinishAccountScreen(
        formData: widget.formData,
      ),
    ));
  }

  bool _check = false;

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
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size16,
            bottom: Sizes.size10,
            left: Sizes.size32,
            right: Sizes.size32,
          ),
          child: ListView(
            children: [
              const Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customize your experience",
                      style: TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.2,
                      ),
                    ),
                    Gaps.v10,
                  ],
                ),
              ),
              Gaps.v20,
              const Text(
                "Track where you see Twitter content across the web",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v14,
              SwitchListTile(
                contentPadding: const EdgeInsets.all(0),
                activeColor: Theme.of(context).appBarTheme.backgroundColor,
                activeTrackColor: Theme.of(context).appBarTheme.foregroundColor,
                value: _check,
                onChanged: (value) {
                  _check = !_check;
                  setState(() {});
                },
                title: Text(
                  "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                  style: TextStyle(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
              Gaps.v20,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                  text: "By signing up, you agree to the ",
                  children: [
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                    ),
                    const TextSpan(
                      text: ", ",
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                    ),
                    const TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy.",
                    ),
                    TextSpan(
                      text: "Learn more",
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v64,
              Gaps.v64,
              Gaps.v64,
              GestureDetector(
                onTap: () => _goLastPage(context),
                child: Container(
                  height: Sizes.size60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: Sizes.size1,
                    ),
                    borderRadius: BorderRadius.circular(
                      Sizes.size48,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
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
}
