import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/side_bar.dart';

class SideBarRow extends StatelessWidget {

  SideBarRow({required this.item});

  final SideBarItem item ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
            width: 42,
            height: 42,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: item.background
            ),
            child: item.icon
        ),
        SizedBox(width: 12,),
        Text(
          item.title
          , style: kCalloutLabelStyle,
        ),
      ],);
  }
}