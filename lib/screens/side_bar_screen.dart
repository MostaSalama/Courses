import 'package:flutter/material.dart';
import 'package:learning/components/side_bar_row.dart';
import 'package:learning/constants.dart';

import '../model/side_bar.dart';

class SideBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34)
        )
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),

      child: SafeArea(

        child: Column(
        
          children: [
            
            Row(
              children: [
        
                CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 21,
                ),
                SizedBox(width: 10,),
                Text(
                  'Mostafa Salama ',
                  style: kHeadlineLabelStyle,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SideBarRow(item: sideBarItems[0],),
            SizedBox(height: 15,),
            SideBarRow(item: sideBarItems[1],),
            SizedBox(height: 15,),
            SideBarRow(item: sideBarItems[2],),
            SizedBox(height: 15,),
            SideBarRow(item: sideBarItems[3],),
            SizedBox(height: 15,),
            Spacer(),
            Row(
              children: [
                Image.asset('asset/icons/icon-logout.png' , width: 17,),
                SizedBox(width: 12,),
                Text(
                    'Log out',
                  style: kSecondaryCalloutLabelStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}