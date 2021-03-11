import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:dev_comunity_app/core/services/authentication_service.dart';
import 'package:dev_comunity_app/meta/views/home_view/home_view.dart';
import 'package:dev_comunity_app/meta/views/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginViewModel extends ChangeNotifier{
  int numOfUsers = 0;
  final AuthenticationService _authenticationService = AuthenticationService();

  String userName;
  String userImage;
  String get getUserName => userName;
  String get getUserImage => userImage;

  navigateToHomeView({BuildContext context}) {
    logIn().whenComplete(() {
      Navigator.pushReplacement(context, PageTransition(
        child: HomeView(),
        type: PageTransitionType.bottomToTop
      ));
    });
  }

  Future logIn() async{
    try{
      await _authenticationService.signInwithGoogle().then((user) {

        if(user.uid != null){
          userName = user.displayName;
          userImage = user.photoURL;
          print(userName);
        }

      });
    } catch(e){
      if(e is FirebaseAuthException){
        ///show error widget
        print(e.message);
      }
    }
  }

  Future logOut({BuildContext context}) async{
    try{
      await _authenticationService.signOutWithGoogle().whenComplete(() {
        Navigator.pushReplacement(context, PageTransition(
            child: LoginView(),
            type: PageTransitionType.bottomToTop
        ));
      });
    } catch(e){
      if(e is FirebaseAuthException){
        ///show error widget
        print(e.message);
      }
    }
  }
}