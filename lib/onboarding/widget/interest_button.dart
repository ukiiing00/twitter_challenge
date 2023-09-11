import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.onTapInterest,
    required this.check,
  });

  final String interest;
  final Function? onTapInterest;
  final bool check;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  void _onClickCheck() {
    widget.onTapInterest!(widget.interest);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClickCheck,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        height: Sizes.size72,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
          vertical: Sizes.size8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
          color: widget.check ? Colors.purple.shade400 : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
                alignment: Alignment.topRight,
                child: FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  size: Sizes.size18,
                  color: Colors.white,
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.interest,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: widget.check ? Colors.white : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
