import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/onboarding/interest_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _disabled = true;
  bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> _passwordFieldKey1 =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey2 =
      GlobalKey<FormFieldState<String>>();

  void _closeFocus() {
    FocusScope.of(context).unfocus();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onClearTap() {
    _passwordFieldKey1.currentState?.reset();
  }

  void _onClearTap2() {
    _passwordFieldKey2.currentState?.reset();
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InterestScreen(),
        ),
        (route) => false);
  }

  String? _validatePassword1(String? value) {
    final passwordField2 = _passwordFieldKey2.currentState!;
    if (value != null && value.length < 8) {
      _disabled = true;
      setState(() {});

      return "비밀번호를 8자리 이상 입력해주세요.";
    }
    if (passwordField2.value != value) {
      passwordField2.validate();
      return null;
    }
    _disabled = false;
    setState(() {});
    return null;
  }

  String? _validatePassword2(String? value) {
    final passwordField = _passwordFieldKey1.currentState!;
    if (value != null && value.length < 8) {
      _disabled = true;
      setState(() {});

      return "비밀번호를 8자리 이상 입력해주세요.";
    }
    if (passwordField.value != value) {
      _disabled = true;
      setState(() {});

      return "위의 비밀전호와 일치하지 않습니다.";
    }
    _disabled = false;
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _closeFocus,
      child: Scaffold(
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.m,
            size: Sizes.size32,
            color: Colors.purple.shade400,
          ),
        ),
        body: SafeArea(
          child: DefaultTextStyle(
            style: TextStyle(
              letterSpacing: -0.4,
              wordSpacing: 0,
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontSize: 15,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size16,
                bottom: Sizes.size10,
                left: Sizes.size32,
                right: Sizes.size32,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You'll need a passwoord",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.2,
                        ),
                      ),
                      Gaps.v14,
                      Text(
                        "Make sure it's 8 charaters or more",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size16,
                            height: 1),
                      ),
                      Gaps.v36,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: _passwordFieldKey1,
                              obscureText: _obscureText,
                              onEditingComplete: () {
                                print('editing');
                              },
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                height: 1,
                                fontWeight: FontWeight.w800,
                              ),
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    const TextStyle(height: -0.1),
                                label: const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                counter: const Text(
                                  "",
                                  style: TextStyle(fontSize: 0),
                                ),
                                suffix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: _onClearTap,
                                      child: FaIcon(
                                        FontAwesomeIcons.solidCircleXmark,
                                        color: Colors.grey.shade500,
                                        size: Sizes.size20,
                                      ),
                                    ),
                                    Gaps.h10,
                                    GestureDetector(
                                      onTap: _toggleObscureText,
                                      child: FaIcon(
                                        _obscureText
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        color: Colors.grey.shade500,
                                        size: Sizes.size20,
                                      ),
                                    ),
                                  ],
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                    width: 1.8,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor!,
                                    width: 1.8,
                                  ),
                                ),
                              ),
                              cursorHeight: Sizes.size24,
                              onChanged: (value) {
                                _passwordFieldKey1.currentState?.validate();
                              },
                              validator: (value) {
                                String? valid = _validatePassword1(value);
                                return valid;
                              },
                            ),
                            Gaps.v14,
                            TextFormField(
                              key: _passwordFieldKey2,
                              obscureText: _obscureText,
                              onEditingComplete: () {
                                print('editing');
                              },
                              maxLength: 12,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                height: 1,
                                fontWeight: FontWeight.w800,
                              ),
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    const TextStyle(height: -0.1),
                                label: const Text(
                                  "Retype-Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                counter: const Text(
                                  "",
                                  style: TextStyle(fontSize: 0),
                                ),
                                suffix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: _onClearTap2,
                                      child: FaIcon(
                                        FontAwesomeIcons.solidCircleXmark,
                                        color: Colors.grey.shade500,
                                        size: Sizes.size20,
                                      ),
                                    ),
                                    Gaps.h10,
                                    GestureDetector(
                                      onTap: _toggleObscureText,
                                      child: FaIcon(
                                        _obscureText
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        color: Colors.grey.shade500,
                                        size: Sizes.size20,
                                      ),
                                    ),
                                  ],
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                    width: 1.8,
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.8,
                                  ),
                                ),
                              ),
                              cursorHeight: Sizes.size24,
                              onChanged: (value) {
                                _passwordFieldKey2.currentState?.validate();
                              },
                              validator: (value) {
                                String? valid = _validatePassword2(value);
                                return valid;
                              },
                            ),
                          ],
                        ),
                      ),
                      Gaps.v20,
                      if (!_disabled)
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                            ),
                          ],
                        )
                    ],
                  ),
                  Gaps.v64,
                  Positioned(
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: _disabled,
                      child: GestureDetector(
                        onTap: _onNextTap,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: Sizes.size60,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: _disabled
                                ? Colors.purple.shade100
                                : Colors.purple.shade300,
                            borderRadius: BorderRadius.circular(
                              Sizes.size48,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: Sizes.size18,
                                  fontWeight: FontWeight.w800,
                                  color: _disabled
                                      ? Colors.grey.shade300
                                      : Colors.white,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
