import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:dev_comunity_app/app/constants/dimensions.dart';
import 'package:dev_comunity_app/core/viewmodels/login_view_model.dart';
import 'package:dev_comunity_app/meta/views/blogs_view/blogs_view.dart';
import 'package:dev_comunity_app/meta/views/home_view/home_view_widgets.dart';
import 'package:dev_comunity_app/meta/views/podcast_view/podcast_view.dart';
import 'package:dev_comunity_app/meta/views/video_view/video_view.dart';
import 'package:dev_comunity_app/meta/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  PageController _pageController = PageController();
  onTap(int i) {
    setState(() {
      index = i;
    });
    _pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorFaint,
      drawer: Drawer(

      ),
      appBar: appBar(
        titleText: 'Dev',
        leadingWidget: null,
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {

            },
          ),
          hSizedBox1,
          GestureDetector(
            onTap: (){
              Provider.of<LoginViewModel>(context, listen: false).logOut(context: context);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(Provider.of<LoginViewModel>(context, listen: false).getUserImage),

            ),
          )
        ]
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int pageIndex){
          setState(() {
            index = pageIndex;
          });
        },
        children: [
          BlogView(),
          VideoView(),
          PodCastView()
        ],
      ),
      bottomNavigationBar: bottomAppBar(
        index: index,
        onTap: onTap
      ),
    );
  }
}
