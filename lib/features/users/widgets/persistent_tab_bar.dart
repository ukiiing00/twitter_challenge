import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        unselectedLabelColor: Colors.grey.shade500,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Theme.of(context).appBarTheme.foregroundColor,
        indicatorWeight: 0.6,
        labelColor: Theme.of(context).appBarTheme.foregroundColor,
        labelStyle: const TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: const EdgeInsets.only(
          bottom: Sizes.size10,
        ),
        tabs: const [
          Text('Threads'),
          Text('Replies'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 29.6;

  @override
  double get minExtent => 29.6;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
