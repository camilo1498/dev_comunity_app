import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_comunity_app/core/services/firestore.dart';
import 'package:dev_comunity_app/meta/views/video_details_view/video_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class VideoViewModel extends ChangeNotifier{
  final FireStoreService _fireStoreService = FireStoreService();
  DocumentSnapshot doc;

  navigateToDetails(BuildContext context, DocumentSnapshot documentSnapshot) {
    doc = documentSnapshot;
    notifyListeners();
    print(doc.data());
    return Navigator.pushReplacement(context, PageTransition(
        child: DetailVideoView(),
        type: PageTransitionType.bottomToTop));
  }


  Stream<QuerySnapshot> streamOfVideos() async*{
    try{
      yield* _fireStoreService.getAllVideos();
    } catch(e) {
      if(e is PlatformException){
        print(e);
      }
    }
  }
}