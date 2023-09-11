import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/users/widgets/first_view.dart';
import 'package:twitter_challenge/features/users/widgets/persistent_tab_bar.dart';
import 'package:twitter_challenge/features/users/widgets/second_view.dart';
import 'package:twitter_challenge/features/users/widgets/userprofile.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    super.key,
    required this.menu,
  });

  final menu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 40,
                leading: const Center(
                  child: FaIcon(FontAwesomeIcons.globe),
                ),
                actions: [
                  const FaIcon(
                    FontAwesomeIcons.instagram,
                  ),
                  Gaps.h24,
                  GestureDetector(
                    onTap: menu,
                    child: const FaIcon(
                      FontAwesomeIcons.barsStaggered,
                    ),
                  ),
                  Gaps.h14,
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size18,
                    right: Sizes.size12,
                  ),
                  child: Column(
                    children: [
                      Gaps.v16,
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'UK',
                          style: TextStyle(
                            fontSize: Sizes.size22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Text(
                              "nomad_uk",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h4,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              child: const Text(
                                "threads.net",
                                style: TextStyle(
                                  fontSize: Sizes.size11,
                                ),
                              ),
                            )
                          ],
                        ),
                        trailing: const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            foregroundImage: AssetImage(
                              'assets/images/2.jpeg',
                            ),
                          ),
                        ),
                      ),
                      Gaps.v4,
                      const Row(
                        children: [
                          Text(
                            "CEO",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Gaps.v16,
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                            height: 32,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(1, -1.5),
                                  child: Container(
                                    width: 21,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      "assets/images/4.jpeg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.8, -0.2),
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      "assets/images/5.jpeg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.2, 0.6),
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      "assets/images/5.jpeg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            '100.5M followers',
                            style: TextStyle(
                              fontSize: Sizes.size14 + Sizes.size1,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v16,
                      const Row(
                        children: [
                          ProfileButton(
                            profile: 'Edit profile',
                          ),
                          Gaps.h10,
                          ProfileButton(
                            profile: 'Share profile',
                          ),
                        ],
                      ),
                      Gaps.v24,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                  delegate: PersistentTabBar(), pinned: true),
            ];
          },
          body: const TabBarView(
            children: [
              FirstTabView(),
              SecondTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
