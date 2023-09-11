import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.site,
    this.icon,
  });

  final String site;
  final FaIcon? icon;

  @override
  Widget build(BuildContext context) {
    bool isIcon = icon != null ? true : false;
    return Container(
      height: Sizes.size64,
      decoration: BoxDecoration(
        color: isIcon ? null : Theme.of(context).appBarTheme.foregroundColor,
        border: Border.all(
          color: Colors.grey.shade400,
          width: Sizes.size1,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size48,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isIcon) icon!,
          Gaps.h14,
          Text(
            isIcon ? "Continue with $site" : site,
            style: TextStyle(
              fontSize: Sizes.size18,
              fontWeight: FontWeight.w800,
              color:
                  isIcon ? null : Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
