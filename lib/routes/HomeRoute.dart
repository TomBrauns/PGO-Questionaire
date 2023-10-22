import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _HomeRoute createState() => new _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.lightBlue),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            //------- LAYOUT -------
            home: Scaffold(
                drawer: Drawer(
                    child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Fomular'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/second');
                      },
                    ),
                    ListTile(
                      title: Text('Umfrage'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/third');
                      },
                    ),
                    ListTile(
                      title: Text('Abschlussseite'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/fourth');
                      },
                    ),
                  ],
                )),
                appBar: AppBar(
                  title: Text('Großes Gruppenprojekt'),
                  backgroundColor: Colors.green,

                  //------- DARK MODE & BRIGHT MODE --------

                  actions: [
                    //------- SETTINGS -------
                    IconButton(
                        icon: Icon(
                            _HomeRoute.themeNotifier.value == ThemeMode.light
                                ? Icons.lightbulb_outline
                                : Icons.lightbulb),
                        onPressed: () {
                          _HomeRoute.themeNotifier.value =
                              _HomeRoute.themeNotifier.value == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                        })
                  ],
                ),

                //--------------- PAGE -----------------
                body: Row(children: <Widget>[
                  //------ LEFT PLACEHOLDER ------
                  Expanded(flex: 30, child: Container()),

                  //------ MAIN COLUMN ------
                  Expanded(
                      flex: 40,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 100),

                            //------- HEADER --------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Willkommen",
                                    style: const TextStyle(fontSize: 30)),
                                SizedBox(width: 50),
                              ],
                            ),
                            SizedBox(height: 30),

                            //------- TEXT --------
                            Text(
                                "Bitte melden Sie sich an und füllen Sie das Formular aus.",
                                style: const TextStyle(fontSize: 24)),
                            SizedBox(height: 100),

                            //------- CHOICES --------
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //------ ANMELDEFORMULAR -------
                                  Expanded(
                                      flex: 45,
                                      child: Column(
                                        children: <Widget>[
                                          Image.network(
                                              'https://images.pexels.com/photos/590022/pexels-photo-590022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                              width: 200,
                                              height: 200),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(
                                                  context, '/third');
                                            },
                                            child: Text('Anmeldeformular'),
                                          ),
                                        ],
                                      )),

                                  //-- PLACEHOLDER --
                                  Expanded(flex: 10, child: Container()),

                                  //------ ANMELDEFORMULAR -------
                                  Expanded(
                                    flex: 45,
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                            'https://image.flaticon.com/icons/png/512/1914/1914868.png',
                                            width: 200,
                                            height: 200),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/second');
                                          },
                                          child: Text('Umfrage'),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ])),

                  //------ RIGHT PLACEHOLDER ------
                  Expanded(flex: 30, child: Container()),
                ]) // MAIN ROW
                ),
          );
        });
  }
}
