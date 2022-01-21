import 'package:flutter/material.dart';
import 'package:modal_stack_router/modal_stack_router.dart';
import 'package:pollyn/src/pages/shared/profile/desktopProfile.dart';
import 'package:pollyn/src/router/routes.dart';
import 'package:pollyn/src/widgets/shared/ChangeAvatar/DesktopChangeAvatar.dart';

class MyProfileStackRouter extends StatelessWidget {
  @override
  build(context) {
    return StackRouter(
      builder: (router) {
        return [
          StackRoute(
            route: PollynRoutes.profile.name,
            child: DesktopProfile(
              onPressAvatar: () {
                router.pushRoute(PollynRoutes.changeAvatar.name);
              },
            ),
          ),
          StackRoute(
            child: DesktopChangeAvatar(
              onChangeAvatar: () {
                router.popRoute();

                final snackBar = StackRouterSnackBar(
                  title: Text(
                    "Profile updated!",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                  ),
                );

                router.showSnackBar(
                  snackBar: snackBar,
                  route: PollynRoutes.profile.name,
                );
              },
            ),
            route: PollynRoutes.changeAvatar.name,
          )
        ];
      },
    );
  }
}
