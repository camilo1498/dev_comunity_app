import 'package:dev_comunity_app/core/viewmodels/login_view_model.dart';
import 'package:dev_comunity_app/meta/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        titleText: 'Home View',
        leadingWidget: null,
        actions: [
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
    );
  }
}
