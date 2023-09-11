import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class SecondTabView extends StatelessWidget {
  const SecondTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Gaps.v12,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size10,
                vertical: Sizes.size4,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                padding: EdgeInsets.zero,
                                width: Sizes.size36 + Sizes.size8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: Sizes.size1,
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/profile.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                          Gaps.v10,
                          Flexible(
                            child: VerticalDivider(
                              width: 2,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.h14,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Anon",
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.1,
                                      height: 1,
                                    ),
                                  ),
                                  Gaps.h3,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    color: Colors.blue,
                                    size: Sizes.size12,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "2m",
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                  Gaps.h10,
                                  FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    size: Sizes.size16,
                                  ),
                                  Gaps.h4,
                                ],
                              ),
                            ],
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: const Text(
                              "Spider Man No Way Home",
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: Sizes.size16,
                                letterSpacing: -0.2,
                                height: 1.6,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.4),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              SizedBox(
                                                height: Sizes.size18,
                                                width: Sizes.size18,
                                                child: CircleAvatar(
                                                  foregroundImage: AssetImage(
                                                      "assets/images/marvel.jpeg"),
                                                ),
                                              ),
                                              Gaps.h8,
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Marvel Entertainment",
                                                        style: TextStyle(
                                                          fontSize:
                                                              Sizes.size16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: -0.1,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      Gaps.h4,
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .solidCircleCheck,
                                                        color: Colors.amber,
                                                        size: Sizes.size12,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Gaps.v8,
                                          RichText(
                                            text: TextSpan(
                                              text:
                                                  "Of course, we got THE meme.\n",
                                              style: TextStyle(
                                                fontSize: Sizes.size16,
                                                color: Theme.of(context)
                                                    .appBarTheme
                                                    .foregroundColor,
                                              ),
                                              children: const [
                                                TextSpan(
                                                  text: "#SpiderManNoWayHome",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      " swings home on Digital March 22 and on 4K UHD & Blu-ray on April 12!  ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Gaps.v16,
                                          Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.asset(
                                                  "assets/images/3spider.jpeg")),
                                        ],
                                      ),
                                    ),
                                    Gaps.v14,
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.grey.shade700,
                                          size: Sizes.size22,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.comment,
                                          size: Sizes.size22,
                                          color: Colors.grey.shade700,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.repeat,
                                          size: Sizes.size18,
                                          color: Colors.grey.shade700,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.paperPlane,
                                          size: Sizes.size18,
                                          color: Colors.grey.shade700,
                                        ),
                                      ],
                                    ),
                                    Gaps.v12,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size10,
                top: Sizes.size4,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    IntrinsicHeight(
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: Sizes.size64,
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: Image.asset(
                              "assets/images/2.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "UK",
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.1,
                                      height: 1,
                                    ),
                                  ),
                                  Gaps.h3,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    color: Colors.blue,
                                    size: Sizes.size12,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "2m",
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                  Gaps.h10,
                                  FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    size: Sizes.size16,
                                  ),
                                  Gaps.h4,
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: const Text(
                                "삼스파이더맨",
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gaps.v14,
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.grey.shade700,
                                          size: Sizes.size22,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.comment,
                                          size: Sizes.size22,
                                          color: Colors.grey.shade700,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.repeat,
                                          size: Sizes.size18,
                                          color: Colors.grey.shade700,
                                        ),
                                        Gaps.h20,
                                        FaIcon(
                                          FontAwesomeIcons.paperPlane,
                                          size: Sizes.size18,
                                          color: Colors.grey.shade700,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v12,
          ],
        ),
      ],
    );
  }
}
