import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({
    super.key,
    required this.model,
    required this.icon,
  });
  final dynamic model;
  final FaIcon icon;

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  void _onFollowTap() {
    widget.model.follow = !widget.model.follow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: ListTile(
            minVerticalPadding: 0,
            leading: Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                    // backgroundImage: NetworkImage(widget.model.image),
                    ),
                Positioned(
                  right: -6,
                  bottom: -4,
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
                    child: Center(
                      child: widget.icon,
                    ),
                  ),
                ),
              ],
            ),
            title: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    widget.model.title,
                    style: const TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.1),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gaps.h5,
                Text(
                  '1h',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
            subtitle: Text(
              widget.model.subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Gaps.h72,
            Flexible(
              child: Text(
                "${widget.model.company} / ${widget.model.position}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        Gaps.v12,
      ],
    );
  }
}
