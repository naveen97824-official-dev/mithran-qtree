import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qtree/components/diagram_one/diagram_one.dart';
import 'package:qtree/components/diagram_two/diagram_two.dart';
import 'package:qtree/components/landing_page/landing_page.dart';
import 'package:qtree/components/login_page/login_page.dart';
import 'package:qtree/middleware/appMiddleware.dart';
import 'package:qtree/reducers/appStateReducer.dart';
import 'package:qtree/states/appState.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

Future<Store<AppState>> createStore(persistor, initialState) async {
  return Store(appStateReducer,
      initialState: (initialState == null ||
              (initialState as AppState).loginState == null)
          ? AppState.initial()
          : initialState,
      middleware: appMiddleWare(persistor));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final persistor = Persistor<AppState>(
      storage: FlutterStorage(location: FlutterSaveLocation.sharedPreferences),
      serializer: JsonSerializer<AppState>(AppState.fromJson),
      debug: true,
      throttleDuration: Duration(seconds: 2));

  // Load initial state
  final initialState = await persistor.load();
  Store<AppState> store = await createStore(persistor, initialState);

  runApp(MyApp(store: store));
}

class MyApp extends StatefulWidget {
  final Store<AppState>? store;
  const MyApp({super.key, this.store});

  @override
  State<MyApp> createState() => MyAppPage();
}

class MyAppPage extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: widget.store!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Home Page',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/login': (context) => LoginPage(),
        },
        home: (widget.store != null &&
                widget.store!.state != null &&
                widget.store!.state.loginState != null &&
                widget.store!.state.loginState!.userDetail != null &&
                widget.store!.state.loginState!.userDetail!.email != null)
            ? LandingPage()
            : LoginPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  String? name;
  bool isFirstChosen = true;

  TabController? tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: pageContend(),
    );
  }

  Widget pageContend() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiagramOne()));
            },
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Text("Navigate to diagram 1")),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiagramTwo()));
            },
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Text("Navigate to diagram 2")),
          )
        ],
      ),
    );
  }

  changeTheTabState() {
    setState(() {
      isFirstChosen = !isFirstChosen;
    });
  }

  Widget diagram3() {
    return Column(
      // alignment: Alignment.centerRight,
      children: <Widget>[
        coloredContainer(Colors.red),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            coloredContainer(Colors.yellow),
            coloredContainer(Colors.yellow)
          ],
        ),
        coloredContainer(Colors.red)
      ],
    );
  }

  Widget diagram2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow)
          ],
        )
      ],
    );
  }

  Widget coloredContainer(Color givenColor) {
    return Container(
      color: givenColor,
      height: 40,
      width: 60,
    );
  }
}
