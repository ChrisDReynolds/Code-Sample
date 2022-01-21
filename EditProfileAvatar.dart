import 'package:flutter/material.dart';
import 'package:pollyn/src/models/user.dart';
import 'package:pollyn/src/theme.dart';
import 'UserAvatar.dart';

class EditProfileAvatar extends StatelessWidget {
  final UserModel user;
  final double size;

  EditProfileAvatar({
    required this.user,
    this.size = 90,
  });

  build(context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 4,
            right: 4,
            bottom: 4,
          ),
          child: UserAvatar(
            user: user,
            size: size,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(6),
              color: sunshineThemeColor,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
