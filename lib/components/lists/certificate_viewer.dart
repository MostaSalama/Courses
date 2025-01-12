import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  const CertificateViewer({super.key});

  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {

  final List<String> certificatesPaths = [
    'asset/certificates/certificate-01.png',
    'asset/certificates/certificate-02.png',
    'asset/certificates/certificate-03.png'
  ];

  late Widget certificateViewer ;

  @override
  void initState() {
    super.initState();

    List<Widget> imageChildren = [];

    certificatesPaths.reversed.toList().asMap().forEach((index,certificate){

      int angleDegree;
      if (index == certificatesPaths.length -1 ) {
        angleDegree = 0 ;
      }else{
        angleDegree = Random().nextInt(10) - 5 ;
      }

      imageChildren.add(
        Transform.rotate(
          angle: angleDegree * (pi / 110),
          child: Image.asset(
            certificate,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });

    certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: certificateViewer,
    );
  }
}
