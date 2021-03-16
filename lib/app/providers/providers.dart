import 'package:dev_comunity_app/core/viewmodels/detail_video_model.dart';
import 'package:dev_comunity_app/core/viewmodels/login_view_model.dart';
import 'package:dev_comunity_app/core/viewmodels/video_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...removeProviders,
  ...localProvider
];

/// Remote Providers => Independent
List<SingleChildWidget> removeProviders = [
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => VideoViewModel()),

];

/// Local Providers => Dependent
List<SingleChildWidget> localProvider = [
ProxyProvider<VideoViewModel, VideoDetailModel>(
    update: (BuildContext context, VideoViewModel videoViewModel, VideoDetailModel videoDetailModel)
    => VideoDetailModel(videoViewModel: videoViewModel)),
];