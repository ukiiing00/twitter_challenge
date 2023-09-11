import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/onboarding/interest_second_screen.dart';
import 'package:twitter_challenge/onboarding/widget/interest_button.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({
    super.key,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final interests = [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ];

  final List<String> _checkedInterests = [];
  bool _checkCountInterests = false;

  void _onNextTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InterestSecondScreen(
        interestList: _checkedInterests,
      ),
    ));
  }

  void _onTapInterest(interest) {
    if (interests.contains(interest)) {
      interests.remove(interest);
      _checkedInterests.insert(0, interest);
      _listKey.currentState?.insertItem(0);
      _checkCountInterests = _checkedInterests.length >= 3 ? true : false;
    } else {
      _checkedInterests.remove(interest);
      interests.insert(0, interest);
      _checkCountInterests = _checkedInterests.length >= 3 ? true : false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: Sizes.size52,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _checkCountInterests
                    ? const Text("Great work  🚀🥰")
                    : Text("${_checkedInterests.length} of 3 selected"),
                IgnorePointer(
                  ignoring: !_checkCountInterests,
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: _checkCountInterests ? Colors.black : null,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size8,
                        horizontal: Sizes.size16,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: _checkCountInterests
                              ? Colors.white
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
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
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.m,
          size: Sizes.size32,
          color: Colors.purple.shade600,
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.size16,
                  bottom: Sizes.size10,
                  left: Sizes.size32,
                  right: Sizes.size32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What do you want to see on M?",
                      style: TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.2,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Select at least 3 interests to personalize your M experience. They will be visible on your profile.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v10,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
              if (_checkedInterests.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: Sizes.size14,
                    left: Sizes.size20,
                    right: Sizes.size20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Interests, right?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.size18,
                        ),
                      ),
                      Gaps.v12,
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          for (var interest in _checkedInterests)
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "#$interest",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size36,
                ),
                child: Wrap(
                  key: _listKey,
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    for (var interest in _checkedInterests)
                      InterestButton(
                        interest: interest,
                        onTapInterest: _onTapInterest,
                        check: true,
                      ),
                    for (var interest in interests)
                      InterestButton(
                        interest: interest,
                        onTapInterest: _onTapInterest,
                        check: false,
                      ),
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
