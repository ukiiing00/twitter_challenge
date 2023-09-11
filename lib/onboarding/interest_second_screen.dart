import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class InterestSecondScreen extends StatefulWidget {
  const InterestSecondScreen({
    super.key,
    required this.interestList,
  });

  final List<String> interestList;

  @override
  State<InterestSecondScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestSecondScreen> {
  final Map<int, List<String>> interestMap = {
    0: [
      "Rap",
      "R&B & soul",
      "Grammy Awards",
      "Pop",
      "K-pop",
      "Music industry",
      "EDM",
      "Music news",
      "Hip hop",
      "Reggae",
      "CCM"
    ],
    1: [
      "animee",
      "Movies & TV",
      "Harry Potter",
      "Mavel Universe",
      "Movienews",
      "Naruto",
      "Movies",
      "Grammy Awards",
      "Entertainment"
    ],
    2: [
      "Rap",
      "R&B & soul",
      "Grammy Awards",
      "Pop",
      "K-pop",
      "Music industry",
      "EDM",
      "Music news",
      "Hip hop",
      "Reggae",
      "CCM"
    ],
  };

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size8,
                    horizontal: Sizes.size18,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      fontWeight: FontWeight.bold,
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
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
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
                          "Interests are used to personalize your experience and will be visible on your profile.",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.v10,
                  Column(
                    children:
                        List.generate(widget.interestList.length, (index) {
                      var interests = interestMap[index] ?? [];
                      return InterestList(
                          interests: interests,
                          title: widget.interestList[index]);
                    }),
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

class InterestList extends StatelessWidget {
  const InterestList({
    super.key,
    required this.interests,
    required this.title,
  });

  final List<String> interests;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size24 + Sizes.size1,
        left: Sizes.size16,
        bottom: Sizes.size24 + Sizes.size1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: Sizes.size20,
            ),
          ),
          Gaps.v32,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 450,
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  for (var interest in interests)
                    InterestSecondButton(interest: interest),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InterestSecondButton extends StatefulWidget {
  const InterestSecondButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestSecondButton> createState() => _InterestSecondButtonState();
}

class _InterestSecondButtonState extends State<InterestSecondButton> {
  bool isCheck = false;

  void _onCheck() {
    isCheck = !isCheck;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCheck,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20 + Sizes.size1,
          vertical: Sizes.size10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(25),
          color: isCheck ? Colors.purple.shade400 : null,
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Sizes.size16,
            color: isCheck ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
