import 'package:flutter/material.dart';
import 'package:learning/components/lists/certificate_viewer.dart';
import 'package:learning/components/lists/continue_watching_list.dart';
import 'package:learning/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow:  [
        BoxShadow(
          color: kShadowColor , offset: Offset(0,-12) , blurRadius: 32
        ),
      ],
      minHeight: 85,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 16
              ),
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Continue Watching',style: kTitle1Style,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: ContinueWatchingList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text('Certificates',style: kTitle1Style,),
          ),
          Expanded(
              child: CertificateViewer()
          ),
        ],
      ),
    );
  }
}
