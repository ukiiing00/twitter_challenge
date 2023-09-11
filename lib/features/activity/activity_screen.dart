import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/activity/widgets/activity_detail_view.dart';
import 'package:twitter_challenge/models/model.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final tabs = [
    "All",
    "Replies",
    "Mentions",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  final icons = [
    const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.pink,
      size: Sizes.size10,
    ),
    const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.pink,
      size: Sizes.size10,
    ),
    const FaIcon(
      FontAwesomeIcons.solidPaperPlane,
      color: Colors.blue,
      size: Sizes.size10,
    ),
    const FaIcon(
      FontAwesomeIcons.solidBell,
      color: Colors.white,
      size: Sizes.size10,
    ),
    const FaIcon(
      FontAwesomeIcons.solidPaperPlane,
      color: Colors.blue,
      size: Sizes.size10,
    ),
  ];

  List<dynamic> listModel = List.generate(10, (index) => Model());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, 94),
          child: AppBar(
            elevation: 0,
            centerTitle: false,
            title: const Text(
              "Activity",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(size.width, 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size14,
                  vertical: Sizes.size10,
                ),
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size2,
                  ),
                  automaticIndicatorColorAdjustment: false,
                  padding: EdgeInsets.zero,
                  isScrollable: true,
                  tabs: [
                    for (var tab in tabs)
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: 105,
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          tab,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => ActivityDetail(
                model: listModel[index],
                icon: icons[index],
              ),
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
