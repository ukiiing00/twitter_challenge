import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/models/model.dart';

class ModelView extends StatefulWidget {
  const ModelView({
    super.key,
    required this.model,
  });
  final Model model;

  @override
  State<ModelView> createState() => _ModelViewState();
}

class _ModelViewState extends State<ModelView> {
  void _onFollowTap() {
    widget.model.follow = !widget.model.follow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.model.image);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: ListTile(
            minVerticalPadding: 0,
            leading: const CircleAvatar(
                // backgroundImage: NetworkImage(widget.model.image),
                ),
            title: Row(
              children: [
                Flexible(
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
                if (widget.model.title.length < 20)
                  const FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.blue,
                    size: Sizes.size14,
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
            trailing: GestureDetector(
              onTap: _onFollowTap,
              child: Container(
                width: 110,
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.model.follow ? "Following" : "Follow",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1,
                    color: widget.model.follow ? Colors.grey.shade600 : null,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Gaps.v8,
        Row(
          children: [
            Gaps.h72,
            Text(
              "${widget.model.count}K followers",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Gaps.v12,
      ],
    );
  }
}
