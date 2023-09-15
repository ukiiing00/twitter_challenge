import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/users/view_models/darkmode_config_vm.dart';

class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  static const routeUrl = 'privacy';
  static const routeName = 'privacy';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        // leading: GestureDetector(
        //   onTap: _onPopTap,
        //   child: const Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       FaIcon(
        //         FontAwesomeIcons.chevronLeft,
        //         size: Sizes.size18,
        //       ),
        //       Gaps.h8,
        //       Center(
        //         child: Text(
        //           "Back",
        //           style: TextStyle(
        //               fontSize: Sizes.size18,
        //               letterSpacing: -0.1,
        //               height: 0.8),
        //           textAlign: TextAlign.start,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        automaticallyImplyLeading: true,
        title: const Text(
          "Privacy",
          style: TextStyle(
              fontSize: Sizes.size18,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.1),
        ),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Gaps.v10,
              Divider(
                height: 2,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                  minVerticalPadding: 0,
                  leading: const FaIcon(
                    FontAwesomeIcons.lock,
                  ),
                  title: const Text("Private profile"),
                  trailing: CupertinoSwitch(
                    activeColor: Theme.of(context).appBarTheme.foregroundColor,
                    thumbColor: Theme.of(context).appBarTheme.backgroundColor,
                    value: true,
                    onChanged: (_) {},
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                  minVerticalPadding: 0,
                  leading: const FaIcon(
                    FontAwesomeIcons.lock,
                  ),
                  title: const Text("Dark Mode"),
                  trailing: CupertinoSwitch(
                    activeColor: Theme.of(context).appBarTheme.foregroundColor,
                    thumbColor: Theme.of(context).appBarTheme.backgroundColor,
                    value: ref.watch(darkmodeConfigProvider).darkmode,
                    onChanged: (value) {
                      ref
                          .read(darkmodeConfigProvider.notifier)
                          .setDarkMode(value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.inbox,
                    ),
                    title: const Text("Mentions"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size18,
                          color: Colors.grey.shade400,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.volumeXmark,
                    ),
                    title: const Text("Muted"),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size18,
                      color: Colors.grey.shade400,
                    )),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.solidEyeSlash,
                    ),
                    title: const Text("Hidden Words"),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size18,
                      color: Colors.grey.shade400,
                    )),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.users,
                    ),
                    title: const Text("Profiles you follow"),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size18,
                      color: Colors.grey.shade400,
                    )),
              ),
              Divider(
                height: 2,
                color: Colors.grey.shade300,
              ),
              ListTile(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Other privacy settings",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                        height: 2.2,
                        fontSize: Sizes.size16 + Sizes.size1,
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.linkedin)
                  ],
                ),
                subtitle: Text(
                  "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: Sizes.size16 + Sizes.size1,
                    letterSpacing: -0.5,
                    height: 1.2,
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.solidCircleXmark,
                    ),
                    title: const Text("Blocked profiles"),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size18,
                      color: Colors.grey.shade400,
                    )),
              ),
              SizedBox(
                height: Sizes.size48 + 2,
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.heartCircleXmark,
                  ),
                  title: const Text("Hide likes"),
                  trailing: FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size18,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
