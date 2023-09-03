import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qtree/ImageAssets.dart';
import 'package:qtree/actions/login/loginAction.dart';
import 'package:qtree/components/home_page/home_page.dart';
import 'package:qtree/components/login_page/login_page.dart';
import 'package:qtree/models/menu/menu.dart';
import 'package:qtree/models/user/userProfile.dart';
import 'package:qtree/states/appState.dart';
import 'package:qtree/states/login/loginState.dart';
import './home_page_view_model.dart';

// json redux
class HomePageView extends State<HomePage> {
  HomePageViewModel? viewModel;
  HomePageView() {
    viewModel = HomePageViewModel();
  }
  @override
  void initState() {
    super.initState();
    viewModel!.menuList.menuItem = [];
    viewModel!.menuList = MenuList.fromJson(viewModel!.menuObj);
    print(viewModel!.userData);
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return StoreConnector<AppState, LoginState>(
      onInit: (store) {
        viewModel!.store1 = store;
      },
      converter: (store) {
        return store.state.loginState!;
      },
      builder: (context, state) {
        viewModel!.userData = UserProfile(
            email: state.userDetail!.email, name: state.userDetail!.password);
        return Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                    accountName:
                        Text(viewModel!.userData?.email ?? "Email not found"),
                    accountEmail:
                        Text(viewModel!.userData?.name ?? "Password not found"),
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  ExactAssetImage(ImageAssets.loginFoodDish))),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                //   child: Text('Drawer Header'),
                // ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: const Text('logout'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                    viewModel!.store1!
                        .dispatch(UserLoginAction(userLogin: null));
                  },
                ),
                Divider(),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            actions: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.trolley,
                  color: Colors.black,
                ),
              )
            ],
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          body: pageContent(),
        );
      },
    );
  }

  Widget pageContent() {
    return Container(
      child: Column(
        children: <Widget>[
          titleSection(),
          SizedBox(
            height: 20,
          ),
          filterFoodSection(),
          SizedBox(
            height: 20,
          ),
          popularNowSection(),
        ],
      ),
    );
  }

  Widget popularNowSection() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular now",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See full menu >>",
                    style: TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: viewModel!.menuList.menuItem!
                    .asMap()
                    .map(
                        (key, eachMenu) => MapEntry(key, popularCard(eachMenu)))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularCard(Menu menu) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: Image.network(menu.avatar!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                menu.title!,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Rs ${menu.price}",
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Positioned(
            right: 22,
            top: 2,
            child: Icon(
              Icons.heart_broken,
              color: Colors.red,
            ))
      ],
    );
  }

  Widget filterFoodSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          children: viewModel!.typesOfFood
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        viewModel!.selctedFoodType = value;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        color: viewModel!.selctedFoodType == value
                            ? Colors.orange
                            : Colors.white,
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: viewModel!.selctedFoodType == value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList()),
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hello chime,",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "What would you like to ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                "eat?",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
            ],
          ),
          searchBarSection(),
        ],
      ),
    );
  }

  Widget searchBarSection() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
    );
  }
}
