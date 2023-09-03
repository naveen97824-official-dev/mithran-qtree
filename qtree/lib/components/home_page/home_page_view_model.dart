import 'package:qtree/models/menu/menu.dart';
import 'package:qtree/models/user/userProfile.dart';
import 'package:qtree/states/appState.dart';
import 'package:redux/redux.dart';

class HomePageViewModel {
  // Add your state and logic here
  List<String> typesOfFood = ['meals', 'snacks', 'sides', 'drinks'];
  String selctedFoodType = 'meals';
  dynamic jsonObj = {
    'name': 'Mithran',
    'email': 'mithran@gmail.com',
    'avatar': ''
  };
  UserProfile? userData;
  MenuList menuList = MenuList();
  Store<AppState>? store1;
  dynamic menuObj = {
    "menuItem": [
      {
        'title': 'burger',
        'price': 250,
        'description':
            "Defines the annotations used by json_serializable to create code for JSON serialization and deserialization.",
        'avatar':
            'https://img.freepik.com/free-photo/front-view-tasty-meat-burger-with-cheese-salad-dark-background_140725-89597.jpg?w=2000&t=st=1690108134~exp=1690108734~hmac=27b4f25b17d7db396f5a2c47bc8326d90ab3c57c22ae735d09c292aed5324b30'
      },
      {
        'title': 'pizza',
        'price': 500,
        'description':
            "Defines the annotations used by json_serializable to create code for JSON serialization and deserialization.",
        'avatar':
            'https://img.freepik.com/free-photo/top-view-pepperoni-pizza-sliced-into-six-slices_141793-2157.jpg?w=2000&t=st=1690108123~exp=1690108723~hmac=ffc67439b49c690ca427185378329a5e7e7eced5a2def94556e74b6b158cd1e1'
      },
      {
        'title': 'chicken BBQ',
        'price': 650,
        'description':
            "Defines the annotations used by json_serializable to create code for JSON serialization and deserialization.",
        'avatar':
            'https://img.freepik.com/free-photo/delicious-chicken-table_144627-8758.jpg?w=2000&t=st=1690108092~exp=1690108692~hmac=6f5875eea8e5bf4930e49a5550e3c05773a57bb11d9aee62c09301e446bd1bb3'
      },
      {
        'title': 'salad',
        'price': 200,
        'description':
            "Defines the annotations used by json_serializable to create code for JSON serialization and deserialization.",
        'avatar':
            'https://img.freepik.com/free-photo/top-view-fresh-vegetables-white-flower-wooden-hammer-delicious-vegan-salad-dark-color-background_179666-47261.jpg?w=2000&t=st=1690108146~exp=1690108746~hmac=cd7520cc261406cb4f4b8e3c3bc6b76aa42816d3b5769dc81930ab92f2e4d5b2'
      }
    ]
  };
}
