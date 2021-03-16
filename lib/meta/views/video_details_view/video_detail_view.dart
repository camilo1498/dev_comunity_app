import 'package:dev_comunity_app/core/viewmodels/detail_video_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailVideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoDetailModel>(builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        title: Text(
          model.fireStoreData.data()['title']
        ),
      ),
    ));
  }
}
