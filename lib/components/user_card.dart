import 'package:flutter/material.dart';
import 'package:foap/components/avatar_view.dart';
import 'package:foap/util/extension.dart';
import '../model/user_model.dart';
import '../theme/icon_enum.dart';
import '../theme/theme_icon.dart';

class UserInfo extends StatelessWidget {
  final UserModel model;

  const UserInfo({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatarView(
          user: model,
          size: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.userName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            model.country != null
                ? Text(
                    '${model.country},${model.city}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}

class SelectableUserCard extends StatefulWidget {
  final UserModel model;
  final bool isSelected;
  final VoidCallback? selectionHandler;

  const SelectableUserCard(
      {Key? key,
      required this.model,
      required this.isSelected,
      this.selectionHandler})
      : super(key: key);

  @override
  SelectableUserCardState createState() => SelectableUserCardState();
}

class SelectableUserCardState extends State<SelectableUserCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              UserAvatarView(
                user: widget.model,
                size: 50,
              ),
              widget.isSelected == true
                  ? Positioned(
                      child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.black45,
                      child: const Center(
                        child: ThemeIconWidget(
                          ThemeIcon.checkMark,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ).round(15))
                  : Container()
            ],
          ).ripple(
            () {
              widget.selectionHandler!();
            },
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.model.userName,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class SelectableUserTile extends StatefulWidget {
  final UserModel model;
  final bool? canSelect;
  final bool? isSelected;
  final VoidCallback? selectionHandler;

  const SelectableUserTile(
      {Key? key,
      required this.model,
      this.canSelect,
      this.isSelected,
      this.selectionHandler})
      : super(key: key);

  @override
  SelectableUserTileState createState() => SelectableUserTileState();
}

class SelectableUserTileState extends State<SelectableUserTile> {
  late final UserModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserInfo(model: model),
        const Spacer(),
        widget.canSelect == true
            ? ThemeIconWidget(
                widget.isSelected == true
                    ? ThemeIcon.checkMarkWithCircle
                    : ThemeIcon.circleOutline,
                color: Theme.of(context).primaryColor,
                size: 25,
              )
            : Container()
      ],
    ).ripple(
      () {
        if (widget.canSelect != true) {
          // if (model.id == getIt<UserProfileManager>().user!.id) {
          //   Get.to(() => const UpdateProfile());
          // } else {
          //   Get.to(() => OtherUserProfile(
          //         userId: model.id,
          //       ));
          // }
        }

        if (widget.selectionHandler != null) {
          widget.selectionHandler!();
        }
      },
    );
  }
}

