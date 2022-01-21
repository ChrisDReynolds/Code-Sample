import 'package:flutter/material.dart';
import 'package:pollyn/src/blocs/stateBlocs/shared/currentUserBloc.dart';
import 'package:pollyn/src/constants/vegetables.dart';
import 'package:pollyn/src/models/publicUser.dart';
import 'package:pollyn/src/models/user.dart';

class AvatarGridView extends StatelessWidget {
  final int crossAxisCount;
  final Function() onChangeAvatar;

  AvatarGridView({
    required this.onChangeAvatar,
    this.crossAxisCount = 3,
  });

  build(context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 0,
      mainAxisSpacing: 24,
      childAspectRatio: 1.4,
      children: avatarVegetables.entries.toList().map<Widget>(
        (avatarVegetable) {
          return InkWell(
            onTap: () async {
              final userId = CurrentUserBloc.instance.value!.id;
              UserModel.store().doc(CurrentUserBloc.instance.value!.id).update({
                "avatar": avatarVegetable.value['id'],
              });
              PublicUserModel.store().doc(userId).update({
                "avatar": avatarVegetable.value['id'],
              });
              onChangeAvatar();
            },
            child: Material(
              color: Colors.grey[200]!,
              shape: CircleBorder(),
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Image(
                    image: AssetImage(
                      'assets/images/vegetables/${avatarVegetable.value['file']}',
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
