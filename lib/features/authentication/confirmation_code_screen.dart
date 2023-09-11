import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/authentication/password_screen.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  List<FocusNode> focus = [];
  final Map<int, String> _code = {};
  bool _disabled = true;
  String _totalCode = "";
  int itemLength = 6;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _closeFocus() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
        ),
        (route) => false);
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _code.clear();
    _totalCode = "";
    _disabled = true;
    setState(() {});
  }

  void _setTotalCode() {
    _code.forEach((key, value) {
      _totalCode += value;
    });
    print(_totalCode);
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
                        "We sent you a code",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.2,
                        ),
                      ),
                      Gaps.v14,
                      Text(
                        "Enter it below to verify",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.size16,
                            height: 1),
                      ),
                      Gaps.v5,
                      Text(
                        "jhon.mobbin@gmail.com",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size16,
                          height: 1,
                        ),
                      ),
                      Gaps.v36,
                      SizedBox(
                        height: Sizes.size64,
                        child: Form(
                          key: _formKey,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: itemLength,
                            separatorBuilder: (context, index) => Gaps.h16,
                            itemBuilder: (context, index) {
                              focus.add(FocusNode());
                              return SizedBox(
                                width: Sizes.size40,
                                height: Sizes.size52,
                                child: TextFormField(
                                  key: ValueKey(index),
                                  focusNode: focus[index],
                                  onEditingComplete: () {
                                    print('editing');
                                  },
                                  maxLength: 1,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    height: 1,
                                    fontSize: Sizes.size30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size24,
                                    ),
                                    counter: const Text(
                                      "",
                                      style: TextStyle(fontSize: 0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
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
                                    print("onChaged: $value");
                                    // if (value == '') {
                                    //   _code.remove(index);
                                    // } else {
                                    //   _code[index] = value;
                                    // }
                                    if (value.isNotEmpty) {
                                      _code[index] = value;
                                      print("code length: ${_code.length}");
                                      if (_code.length == itemLength) {
                                        _formKey.currentState!.validate();
                                        _setTotalCode();
                                        _closeFocus();
                                        _disabled = false;
                                      } else {
                                        _disabled = true;

                                        focus[index + 1].requestFocus();
                                      }
                                    } else {
                                      _code.remove(index);
                                      _disabled = true;
                                      print("code length: ${_code.length}");
                                      setState(() {});
                                    }
                                  },
                                  validator: (value) {
                                    print(value);
                                    if (value != null && value.isEmpty) {
                                      return "plz";
                                    }
                                    _closeFocus();
                                    return null;
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _resetForm,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size20,
                                vertical: Sizes.size10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    25,
                                  ),
                                  color: Colors.black),
                              child: const Text(
                                "reset",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
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
                                : Colors.purple.shade600,
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
                                        : Colors.white),
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
