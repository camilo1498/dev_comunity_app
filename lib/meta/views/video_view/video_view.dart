import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:dev_comunity_app/app/constants/dimensions.dart';
import 'package:dev_comunity_app/core/viewmodels/video_view_model.dart';
import 'package:dev_comunity_app/meta/widgets/loading_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoView extends StatelessWidget {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: bgColor,
          body: StreamBuilder<QuerySnapshot>(
            stream: model.streamOfVideos(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return loadingWidget();
              } else{
                return _listOfVideos(
                  querySnapshot: snapshot,
                  context: context
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _listOfVideos({dynamic querySnapshot, BuildContext context}) {
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: false,
      child: ListView(
        children: querySnapshot.data.docs
            .map((documentSnapshot) => blockOfVideo(
                context: context,

        ))
            .toList(),
      ),
    );
  }

  Widget blockOfVideo({BuildContext context, DocumentSnapshot documentSnapshot}) {
    var _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: _size.height * 0.3,
                  width: _size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        documentSnapshot.data()['thumbnail']
                      )
                    )
                  ),
                ),
                Positioned(
                  top: 195,
                  left: 355,
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          documentSnapshot.data()['length'],
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        documentSnapshot.data()['userImage'],
                      ),
                    ),
                    hSizedBox2,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            documentSnapshot.data()['title'],
                            style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            documentSnapshot.data()['username'],
                            style: TextStyle(
                                color: yellowColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Spacer(),
                IconButton(
                  color: whiteColor,
                  icon: Icon(EvaIcons.moreVertical),
                onPressed: (){},
                ),
                Divider()
              ],
            )
          ],
        ),
      ),
    );
  }
}
