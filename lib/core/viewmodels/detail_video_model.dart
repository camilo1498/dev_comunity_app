import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_comunity_app/core/viewmodels/video_view_model.dart';
import 'package:flutter/material.dart';

class VideoDetailModel extends ChangeNotifier{

  final VideoViewModel videoViewModel;
  VideoDetailModel({@required this.videoViewModel});
  DocumentSnapshot get fireStoreData => videoViewModel.doc;
}