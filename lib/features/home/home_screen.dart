import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/features/home/widgets/home_post_item_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    this.addPost,
    this.text,
    this.newImage,
  });

  late bool? addPost;
  late String? text;
  late XFile? newImage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('im built!');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              SvgPicture.asset(
                "assets/images/threads.svg",
                width: 33,
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
              Gaps.v10,
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          if (widget.addPost ?? false) ...[
            HomePostItemWidget(
              userId: "스와이프",
              script: "${widget.text}",
              replieNum: 100,
              likes: 400,
              imageName: "profile",
              isImage: true,
              newImage: widget.newImage,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
          const HomePostItemWidget(
            userId: "스와이프",
            script:
                "마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블 마블마블 브루마블",
            replieNum: 36,
            likes: 39,
            imageName: "profile",
            isImage: true,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          const HomePostItemWidget(
            userId: "반응형",
            script: "안녕 나는 반응형이야. 텍스트를 누르면 옆에 회색선이 같이 늘어나는 걸 볼 수 있어.",
            replieNum: 36,
            likes: 39,
            imageName: "profile",
            isImage: false,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          const HomePostItemWidget(
            userId: "플레이스홀더",
            script: "탭을 옮겨도 내가 스크롤한 위치 위치를 유지하지",
            replieNum: 36,
            likes: 39,
            imageName: "profile",
            isImage: true,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey.withOpacity(0.3),
          ),
          const HomePostItemWidget(
            userId: "플러터 개발자",
            script: "노마드 코더와 함께라면 누구나 플러터 개발자로 다시 태어날 수 있음.",
            replieNum: 36,
            likes: 39,
            imageName: "profile",
            isImage: false,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
