import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: ProfilePicUrl==null?AssetImage('assets/person.png'):NetworkImage(ProfilePicUrl),
        radius: 65,
      ),
    );
  }
}
