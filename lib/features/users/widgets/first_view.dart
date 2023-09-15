import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class FirstTabView extends StatelessWidget {
  const FirstTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.v12,
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
                                "I'm Iron man",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          const Text(
                                            "Hope this worked...",
                                            style: TextStyle(
                                              fontSize: Sizes.size16,
                                              letterSpacing: -0.2,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Gaps.v16,
                                          Wrap(
                                            spacing: Sizes.size2,
                                            runSpacing: Sizes.size2,
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Image.asset(
                                                          "assets/images/finger1.png"),
                                                    ),
                                                  ),
                                                  Gaps.h2,
                                                  Flexible(
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Image.asset(
                                                          "assets/images/finger2.png"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Image.asset(
                                                          "assets/images/finger3.png"),
                                                    ),
                                                  ),
                                                  Gaps.h4,
                                                  Flexible(
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Image.asset(
                                                          "assets/images/finger4.png"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                          // Container(
                                          //   clipBehavior: Clip.hardEdge,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //   ),
                                          //   child: Image.asset(
                                          //       "assets/images/1.jpeg"),
                                          // ),
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
            Gaps.v14,
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.4),
            )
          ],
        ),
        Column(
          children: [
            Gaps.v12,
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                right: 10,
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
                                "Hello, Spider Man",
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                          ),
                          Gaps.v10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          const Text(
                                            "Thank you, Steve. Rest in peace.",
                                            style: TextStyle(
                                              fontSize: Sizes.size16,
                                              letterSpacing: -0.2,
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
                                                  "assets/images/spider.jpeg")),
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
            Gaps.v14,
            Divider(
              height: 2,
              color: Colors.grey.withOpacity(0.4),
            )
          ],
        ),
        Column(
          children: [
            Gaps.v12,
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                right: 10,
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
                                "DOCTOR STRANGE",
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                          ),
                          Gaps.v10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
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
                                                  "Just announced in Hall H at ",
                                              style: TextStyle(
                                                  fontSize: Sizes.size16,
                                                  color: Theme.of(context)
                                                      .appBarTheme
                                                      .foregroundColor),
                                              children: const [
                                                TextSpan(
                                                  text: "#SDCC, ",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                TextSpan(
                                                    text:
                                                        "Marvel Studios’ DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS with Benedict Cumberbatch and Elizabeth Olsen. Scott Derrickson returns as director. In theaters May 7, 2021.")
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
                                                "assets/images/doctor.jpeg"),
                                          ),
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
            Gaps.v14,
            Divider(
              height: 2,
              color: Colors.grey.withOpacity(0.4),
            )
          ],
        ),
      ],
    );
  }
}
