import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/authentication/experiece_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _userEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _birthdayEditingController =
      TextEditingController();

  DateTime initialDate = DateTime.now();

  String _emailPhone = "";
  String _userName = "";
  String _birthDay = "";
  bool _emailPhoneValid = false;
  bool _userValid = false;
  bool _birthDayValid = false;
  bool _disabled = false;
  bool _helpText = false;
  final Map<String, String> _formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailEditingController.addListener(() {
      _emailPhone = _emailEditingController.text;
      setState(() {});
    });
    _userEditingController.addListener(() {
      _userName = _userEditingController.text;
      setState(() {});
    });
    _birthdayEditingController.addListener(() {
      _birthDay = _birthdayEditingController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _userEditingController.dispose();
    _emailEditingController.dispose();
    _birthdayEditingController.dispose();
    super.dispose();
  }

  void _onFormButton() {
    if (_emailPhoneValid && _userValid && _birthDayValid) {
      _disabled = true;
    } else {
      _disabled = false;
    }
  }

  String? _isEmailPhoneNumberValid() {
    if (_emailPhone.isEmpty) return null;
    final reqExp = RegExp(
      r'^([a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-zA-Z])$|(010(?!0[1-9])[0-9]{4}(?!0000)[0-9]{4})$',
    );
    if (!reqExp.hasMatch(_emailPhone)) {
      _emailPhoneValid = false;
      _onFormButton();
      return "Invaild";
    } else {
      _emailPhoneValid = true;
      _onFormButton();
    }
    return null;
  }

  String? _isUsernameValid() {
    if (_userName.isEmpty) return null;
    final reqExp = RegExp(
      r'^([가-힣a-zA-Z0-9+_.-]{8,12})$',
    );
    if (!reqExp.hasMatch(_userName)) {
      _userValid = false;
      _onFormButton();
      return "Invaild";
    } else {
      _userValid = true;
      _onFormButton();
    }
    return null;
  }

  String? isBirthdayValid() {
    if (_birthDay.isEmpty) {
      _birthDayValid = false;
      _onFormButton();
      return null;
    }
    final reqExp = RegExp(
      r'^(\d{4}-\d{2}-\d{2})$',
    );
    if (!reqExp.hasMatch(_birthDay)) {
      _birthDayValid = false;
      _onFormButton();
      return "Invaild";
    } else {
      _birthDayValid = true;
      _onFormButton();
    }
    return null;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayEditingController.value = TextEditingValue(text: textDate);
  }

  void _backPage() {
    Navigator.of(context).pop();
  }

  void _noFucusTap(value) {
    FocusScope.of(context).unfocus();
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ExperienceScreen(
              formData: _formData,
            ),
          ),
        );
      }
    }
  }

  void _onDatePickerTap() async {
    Duration minDate = initialDate.difference(DateTime(2005));
    Duration maxDate = initialDate.difference(DateTime(1980));
    _helpText = true;
    await showModalBottomSheet(
      elevation: 1,
      context: context,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      isScrollControlled: true,
      builder: (context) => Container(
        height: 230,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: CupertinoDatePicker(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          initialDateTime: initialDate.subtract(minDate),
          maximumDate: initialDate.subtract(minDate),
          minimumDate: initialDate.subtract(maxDate),
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _noFucusTap,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: _backPage,
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: Sizes.size18,
                              ),
                            ),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.twitter,
                          size: Sizes.size32,
                          color: Colors.blue.shade600,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size32,
                    ),
                    child: Form(
                      key: _formKey,
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
                            autocorrect: false,
                            controller: _userEditingController,
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: Sizes.size18,
                            ),
                            decoration: InputDecoration(
                              errorText: _isUsernameValid(),
                              labelText: "Name",
                              hintText: "8 to 12 characters",
                              hintStyle: const TextStyle(
                                fontSize: Sizes.size14,
                              ),
                              floatingLabelStyle: TextStyle(
                                height: -0.3,
                                fontSize: Sizes.size20,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor,
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
                              suffixIcon: _userValid
                                  ? const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: Colors.green,
                                    )
                                  : null,
                              suffixIconConstraints: BoxConstraints.tight(
                                const Size(30, 1),
                              ),
                            ),
                            cursorColor: Colors.blue.shade400,
                            cursorHeight: Sizes.size24,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please write your name";
                              }
                              return _isUsernameValid();
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                _formData['name'] = newValue;
                              }
                            },
                          ),
                          Gaps.v10,
                          TextFormField(
                            controller: _emailEditingController,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: Sizes.size18,
                            ),
                            decoration: InputDecoration(
                              errorText: _isEmailPhoneNumberValid(),
                              labelText: "Phone number or email address",
                              hintText: "example@email.come or 01012345678",
                              hintStyle: const TextStyle(
                                fontSize: Sizes.size14,
                              ),
                              floatingLabelStyle: TextStyle(
                                height: -0.3,
                                fontSize: Sizes.size20,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor,
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
                              suffixIcon: _emailPhoneValid
                                  ? const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: Colors.green,
                                    )
                                  : null,
                              suffixIconConstraints: BoxConstraints.tight(
                                const Size(30, 1),
                              ),
                            ),
                            cursorColor: Colors.blue.shade400,
                            cursorHeight: Sizes.size24,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please write your email or phone number";
                              }
                              return _isEmailPhoneNumberValid();
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                _formData['account'] = newValue;
                              }
                            },
                          ),
                          Gaps.v20,
                          TextFormField(
                            onTap: _onDatePickerTap,
                            keyboardType: TextInputType.none,
                            controller: _birthdayEditingController,
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: Sizes.size18,
                            ),
                            decoration: InputDecoration(
                              errorText: isBirthdayValid(),
                              hintText: "Date of birth",
                              hintStyle: const TextStyle(
                                fontSize: Sizes.size16,
                              ),
                              helperText: _helpText
                                  ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                                  : null,
                              helperMaxLines: 3,
                              helperStyle: const TextStyle(
                                fontSize: Sizes.size16,
                                letterSpacing: -0.3,
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
                              suffixIcon: _birthDayValid
                                  ? const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: Colors.green,
                                    )
                                  : null,
                              suffixIconConstraints: BoxConstraints.tight(
                                const Size(30, 15),
                              ),
                            ),
                            cursorColor: Colors.blue.shade400,
                            cursorHeight: Sizes.size24,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please pick your birthday";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                _formData['date'] = newValue;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 25,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                          horizontal: Sizes.size16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size24,
                          ),
                          color:
                              !_disabled ? Colors.grey.shade500 : Colors.black,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          style: TextStyle(
                            color: !_disabled
                                ? Colors.grey.shade400
                                : Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                          child: const Text(
                            'Next',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
