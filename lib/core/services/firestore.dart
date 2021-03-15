import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{
  final CollectionReference _videoCollection = FirebaseFirestore.instance.collection('videos');
  Stream<QuerySnapshot> getAllVideos() async*{
    yield* _videoCollection.snapshots();
  }
  
}