import 'package:flutter/material.dart';
import 'package:pollyn/src/models/user.dart';
import 'package:pollyn/src/widgets/shared/FlatFormInput.dart';

class ProfileForm extends StatelessWidget {
  final UserModel user;
  final double? width;

  ProfileForm({
    required this.user,
    this.width,
  });

  build(context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlatFormInput(
            labelText: 'Name',
            maxLines: 1,
            readOnly: true,
            prefixIcon: Icon(Icons.person),
            initialValue: user.name,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          FlatFormInput(
            labelText: 'Email',
            readOnly: true,
            prefixIcon: Icon(Icons.email),
            maxLines: 1,
            initialValue: user.email,
          ),
        ],
      ),
    );
  }
}
