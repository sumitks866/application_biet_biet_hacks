import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/person.png'),
        radius: 65,
      ),
    );
  }
}
