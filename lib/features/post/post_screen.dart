import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool _isWriting = false;
  String _text = '';
  bool _onScale = false;
  bool _onScalePost = false;
  XFile? photo;

  void _onPostButton() {
    _isWriting = true;
    setState(() {});
  }

  void _onModalPop() {
    _onScale = true;
    setState(() {});
    Navigator.of(context).pop();
  }

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onSubmit() {
    _onScalePost = true;
    setState(() {});
    Navigator.of(context).pop([_text, photo]);
  }

  void _unFocus() {
    FocusScope.of(context).unfocus();
  }

  void _onCameraTap() async {
    // photo = await Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => const CameraScreen(),
    // ));
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _unFocus,
      child: Container(
        height: size.height * 0.935,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.hardEdge,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: Sizes.size80,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            leading: GestureDetector(
              onTap: _onModalPop,
              child: AnimatedScale(
                scale: _onScale ? 1.6 : 1,
                duration: const Duration(milliseconds: 100),
                child: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size1,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
            ),
            title: const Text(
              "New thread",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size18,
              ),
            ),
            elevation: 0,
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
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
                                Gaps.v10,
                                Flexible(
                                  child: VerticalDivider(
                                    width: 2,
                                    color: Colors.grey.shade300,
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
                                Text(
                                  widget.userId,
                                  style: const TextStyle(
                                    fontSize: Sizes.size14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.1,
                                    height: 1,
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                      children: [
                                        TextField(
                                          keyboardType: TextInputType.multiline,
                                          textInputAction:
                                              TextInputAction.newline,
                                          minLines: null,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              hintText: "Start a thread...",
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: -0.1,
                                                color: Colors.grey.shade600,
                                              ),
                                              border: InputBorder.none),
                                          cursorColor: Colors.blue.shade700,
                                          cursorHeight: Sizes.size20,
                                          onChanged: (value) {
                                            print(value);
                                            if (value.isNotEmpty) {
                                              _onPostButton();
                                              _text = value;
                                              return;
                                            }
                                            _isWriting = false;
                                            setState(() {});
                                            return;
                                          },
                                        ),
                                        if (photo != null)
                                          Image.file(
                                            File(photo!.path),
                                            width: size.width,
                                            fit: BoxFit.fitWidth,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gaps.v20,
                                GestureDetector(
                                  onTap: _onCameraTap,
                                  child: FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    color: Colors.grey.shade400,
                                    size: Sizes.size20,
                                  ),
                                ),
                                Gaps.v10,
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
                        Gaps.h12,
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.v36,
                  Gaps.v20,
                ],
              ),
              Gaps.v36,
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Anyone can reply",
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade600,
                          letterSpacing: -0.1,
                        ),
                      ),
                      GestureDetector(
                        onTap: _onSubmit,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: _onScalePost ? 1.6 : 1.0,
                          child: Text(
                            "Post",
                            style: TextStyle(
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.bold,
                              color: _isWriting
                                  ? Colors.blue
                                  : Colors.blue.shade100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            height: 0,
          ),
        ),
      ),
    );
  }
}
