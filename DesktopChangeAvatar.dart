import 'package:flutter/material.dart';
import 'package:modal_stack_router/modal_stack_router.dart';
import 'package:pollyn/src/widgets/desktop/StackRouterScaffoldTitle.dart';
import 'package:pollyn/src/widgets/shared/AvatarGridView.dart';

class DesktopChangeAvatar extends StatelessWidget {
  final void Function() onChangeAvatar;

  DesktopChangeAvatar({
    required this.onChangeAvatar,
  });

  build(context) {
    return Container(
      height: 450,
      width: 500,
      child: StackRouterScaffold(
        appBar: StackRouterAppBar(
          title: StackRouterScaffoldTitle(
            text: 'profile pick',
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            bottom: 0,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Text(
                "Choose from these assorted veggies to use as your profile picture.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      color: Colors.grey[700]!,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
              ),
              Expanded(
                child: AvatarGridView(
                  crossAxisCount: 4,
                  onChangeAvatar: onChangeAvatar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
