import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qtree/ImageAssets.dart';
import 'package:qtree/actions/login/loginAction.dart';
import 'package:qtree/components/landing_page/landing_page.dart';
import 'package:qtree/components/login_page/login_page.dart';
import 'package:qtree/states/appState.dart';
import 'package:qtree/states/login/loginState.dart';
import 'package:qtree/theme/colorTheme.dart';
import './login_page_view_model.dart';

class LoginPageView extends State<LoginPage> {
  LoginPageViewModel? viewModel;
  LoginPageView() {
    viewModel = LoginPageViewModel();
  }
  String chosenTab = "signIn";

  bool isRemember = false;
  @override
  void initState() {
    super.initState();
    viewModel!.loginButtonBuilder = StreamController<dynamic>.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StoreConnector<AppState, LoginState>(
        onInit: (store) {
          viewModel!.store1 = store;
        },
        converter: (store) {
          return store.state.loginState!;
        },
        builder: (context, state) {
          return pageContent();
        },
      ),
    );
  }

  Widget pageContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageSection(),
          SizedBox(
            height: 10,
          ),
          signOrSignUpSection(),
          OtherSignInOption(),
        ],
      ),
    );
  }

  Widget imageSection() {
    return Container(
      height: 200,
      width: 200,
      child: Image.asset(
        ImageAssets.loginFoodDish,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget signOrSignUpSection() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: tabSection(),
      ),
    );
  }

  Widget tabSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  onTabChange("signIn");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: chosenTab == "signIn"
                            ? ColorTheme.colorTheme.darkGrey
                            : Colors.white,
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: chosenTab == "signIn"
                          ? Colors.orange
                          : Colors.orange[300],
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTabChange("signUp");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: chosenTab == "signUp"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: chosenTab == "signUp"
                          ? Colors.orange
                          : Colors.orange[300],
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: chosenTab == "signIn" ? signInSection() : Container(),
          ),
        ],
      ),
    );
  }

  Widget signInSection() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (value) {
              viewModel!.userData.email = value;
              viewModel!.loginButtonBuilder.add("change");
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'E-mail address',
              hintText: 'Enter Your e-mail address',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (value) {
              viewModel!.userData.password = value;
              viewModel!.loginButtonBuilder.add("hgfhf");
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
              hintText: 'Enter Your password',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            obscureText: true,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerRight,
            child: Text(
              "Forget password?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          checkboxSection(),
          loginButton(),
        ],
      ),
    );
  }

  Widget loginButton() {
    return StreamBuilder<dynamic>(
        stream: viewModel!.loginButtonBuilder.stream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              if (viewModel!.userData.validateLoginButton()) {
                viewModel!.store1!
                    .dispatch(UserLoginAction(userLogin: viewModel!.userData));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: viewModel!.userData.validateLoginButton()
                      ? Colors.orange
                      : ColorTheme.colorTheme.darkGrey),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  Widget checkboxSection() {
    return Container(
      child: CheckboxListTile(
        title: Text("Remember me"),
        value: isRemember,
        onChanged: (newValue) {
          setState(() {
            isRemember = newValue!;
          });
        },
        checkColor: Colors.black,
        contentPadding: EdgeInsets.zero,
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }

  onTabChange(String selectedTab) {
    setState(() {
      chosenTab = selectedTab;
    });
  }

  Widget OtherSignInOption() {
    return Container(
      height: 150,
      child: Column(
        children: <Widget>[
          orSection(),
          SizedBox(
            height: 20,
          ),
          Text("Sign in using: "),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/png/google.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/png/fb.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/png/twitter.png"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget orSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Or"),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}
