import 'package:flutter/material.dart';
import 'package:learning/components/cards/course_section_card.dart';
import 'package:learning/constants.dart';
import 'package:learning/model/course.dart';

class CourseSectionList extends StatelessWidget {
  const CourseSectionList({super.key});

  List<Widget> courseSectionsWidgets() {
    List<Widget> cards = [];
    for(var course in courseSections){
      cards.add(Padding(
          padding: EdgeInsets.only(bottom: 20),
        child: CourseSectionCard(course: course,),
      )
      );
    }

    cards.add(Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
          'No more Sections to view, look\nfor more in our courses',
        style: kCaptionLabelStyle,
        textAlign: TextAlign.center,
      ),
    ));

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: courseSectionsWidgets(),
      ),
    );
  }
}
