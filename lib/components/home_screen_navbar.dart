import 'package:flutter/material.dart';
import 'package:learning/components/search_field_widget.dart';
import 'package:learning/constants.dart';
import '../buttons/sidebar_button.dart';

class HomeScreenNavbar extends StatelessWidget {
  HomeScreenNavbar({required this.triggerAnimation});
  final Function triggerAnimation;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(triggerAnimation: triggerAnimation,),
          SearchFieldWidget(),
          Icon(Icons.notifications , color: kPrimaryLabelColor,),
          SizedBox(width: 16,),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

