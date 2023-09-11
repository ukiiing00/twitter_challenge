import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class HomePostItemWidget extends StatefulWidget {
  const HomePostItemWidget({
    super.key,
    required this.userId,
    required this.script,
    required this.replieNum,
    required this.likes,
    required this.imageName,
    required this.isImage,
    this.newImage,
  });

  final String userId;
  final String script;
  final int replieNum;
  final int likes;
  final String imageName;
  final bool isImage;
  final XFile? newImage;

  @override
  State<HomePostItemWidget> createState() => _HomePostItemWidgetState();
}

class _HomePostItemWidgetState extends State<HomePostItemWidget> {
  bool _isEllipsis = true;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     _size = _getSize();
    //   });
    // });
  }

  void _onEllipsis() {
    _isEllipsis = !_isEllipsis;
    setState(() {});
  }

  void _onBottomSheet() async {
    // final result = await showModalBottomSheet(
    //     showDragHandle: true,
    //     elevation: 0,
    //     backgroundColor: Colors.white,
    //     context: context,
    //     builder: (context) => const RequiredmentBottomSheet());
    // print(result);

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ThreadScreen(
    //       isImage: widget.isImage,
    //       script: widget.script,
    //       userId: widget.userId,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v12,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
            vertical: Sizes.size8,
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
                              "assets/images/${widget.imageName}.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            right: -4,
                            bottom: 2,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.white,
                                  width: Sizes.size2,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: Sizes.size14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Flexible(
                        child: VerticalDivider(
                          width: 2,
                          color: Colors.grey.withOpacity(0.3),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.userId,
                                style: const TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.1,
                                  height: 1,
                                ),
                              ),
                              Gaps.h3,
                              const FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.blue,
                                size: Sizes.size12,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "2m",
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              Gaps.h10,
                              GestureDetector(
                                onTap: _onBottomSheet,
                                child: const FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: Sizes.size16,
                                ),
                              ),
                              Gaps.h4,
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _onEllipsis,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            widget.script,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: Sizes.size16,
                              letterSpacing: -0.2,
                              height: 1.6,
                            ),
                            maxLines: _isEllipsis ? 1 : 5,
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
                                Gaps.v6,
                                if (widget.isImage)
                                  widget.newImage != null
                                      ? Image.file(
                                          File(widget.newImage!.path),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 3,
                                            separatorBuilder:
                                                (context, index) => Gaps.h10,
                                            itemBuilder: (context, index) =>
                                                Container(
                                              width: 290,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.asset(
                                                "assets/images/${index + 1}.jpeg",
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Sizes.size36 + Sizes.size8,
                height: 40,
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
                "${widget.replieNum} replies ･ ${widget.likes} likes",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        Gaps.v12,
      ],
    );
  }
}
