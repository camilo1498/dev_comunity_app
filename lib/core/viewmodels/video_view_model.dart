import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_comunity_app/core/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoViewModel extends ChangeNotifier{
  final FireStoreService _fireStoreService = FireStoreService();
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