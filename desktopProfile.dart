import 'package:flutter/material.dart';
import 'package:modal_stack_router/modal_stack_router.dart';
import 'package:pollyn/src/blocs/stateBlocs/shared/currentUserBloc.dart';
import 'package:pollyn/src/models/user.dart';
import 'package:pollyn/src/theme.dart';
import 'package:pollyn/src/widgets/shared/EditProfileAvatar.dart';
import 'package:pollyn/src/widgets/shared/LoadingIndicator.dart';
import 'package:pollyn/src/widgets/shared/ProfileForm.dart';

class DesktopProfile extends StatelessWidget {
  final Function() onPressAvatar;

  DesktopProfile({
    required this.onPressAvatar,
  });

  build(context) {
    return Container(
      height: 400,
      width: 400,
      child: StreamBuilder<UserModel?>(
        stream: CurrentUserBloc.instance.stream,
        builder: (context, userSnapshot) {
          if (!userSnapshot.hasData) {
            return LoadingIndicator();
          }
          final UserModel user = userSnapshot.data!;

          return StackRouterScaffold(
            extendBodyBehindAppBar: true,
            child: Column(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      onPressAvatar();
                    },
                    child: Stack(
                      children: [
                        Container(
                          //Visible blue area at the top of the modal view
                          color: skyBlueThemeColor,
                          height: 75,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              //Pushes down user's avatar to create space between it and the top of the page
                              top: 25,
                            ),
                            child: EditProfileAvatar(
                              user: user,
                              size: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: Container(
                    child: ProfileForm(
                      user: user,
                      width: 300,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
